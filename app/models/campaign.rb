class Campaign < ActiveRecord::Base
  after_validation :resolve_location

  validates_presence_of :title, :details, :duration, :funding_goal, :zip_code

  PUBLICATION_STATES = %w(draft review approved published)

  PUBLICATION_STATES.each do |status|
    define_method "#{status}?" do
      publication_status == status
    end
  end

  def self.valid_publication_status?(status)
    PUBLICATION_STATES.include? status
  end

  def resolve_location
    return unless errors.empty?

    location = Geocoder.search(zip_code, params: { countrycodes: 'us' }).first

    return unless location

    self.latitude = location.latitude
    self.longitude = location.longitude
    self.city = location.city
    self.state = location.state_code
  end

  belongs_to :user
  delegate :email, to: :user, prefix: true

  has_many :items

  # Logo and Banner Images
  has_attached_file :logo,
                    styles: { medium: '300x300#', thumb: '180x180#' },
                    default_url: 'logo.default.:style.png'

  validates_attachment_content_type :logo, content_type: %r{\Aimage\/.*\Z}

  has_attached_file :banner,
                    styles: { large: '1200x300#', thumb: '400x100#' },
                    default_url: 'banner.default.:style.png'

  validates_attachment_content_type :banner, content_type: %r{\Aimage\/.*\Z}

  validates :publication_status, inclusion: { in: PUBLICATION_STATES }
  validates :funding_goal, inclusion: { in: 1..1_000_000 }
  validates :duration, inclusion: { in: [30, 60] }

  validates :zip_code, format: {
    with: /\d{5}(-\d{4})?/,
    message: 'should be in the form 12345 or 12345-1234' }

  scope :drafts, -> { where(publication_status: 'draft') }

  def submit_for_review!
    self.publication_status = 'review'
    save
  end

  def publish!
    self.published_at = Time.now
    self.expires_at = published_at + duration.days
    self.publication_status = 'published'
    save

    CampaignExpirationWorker.perform_at(expires_at, id)
  end
end

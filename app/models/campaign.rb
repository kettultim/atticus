class Campaign < ActiveRecord::Base
  validates_presence_of :title, :details

  PUBLICATION_STATES = %w(review draft)

  belongs_to :user
  delegate :email, to: :user, prefix: true

  has_attached_file :logo,
                    styles: { medium: '300x300#', thumb: '180x180#' },
                    default_url: 'logo.default.:style.png'

  validates_attachment_content_type :logo, content_type: %r{\Aimage\/.*\Z}

  has_attached_file :banner,
                    styles: { large: '1200x300#', thumb: '400x100#' },
                    default_url: 'banner.default.:style.png'

  validates_attachment_content_type :banner, content_type: %r{\Aimage\/.*\Z}

  scope :drafts, -> { where(publication_status: 'draft') }

  def self.valid_publication_status?(status)
    PUBLICATION_STATES.include? status
  end

  def submit_for_review!
    self.publication_status = 'review'
    save
  end
end

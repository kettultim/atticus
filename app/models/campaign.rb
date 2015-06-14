class Campaign < ActiveRecord::Base
  validates_presence_of :title, :details

  PUBLICATION_STATES = ["review"]

  belongs_to :user

  has_attached_file :logo,
  styles: { medium: "300x300#", thumb: "180x180#" },
  default_url: lambda { |img| img.instance.default_logo_url }

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_attached_file :banner,
  styles: { large: "1200x300#", thumb: "400x100#" },
  default_url: lambda { |img| img.instance.default_banner_url }

  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\Z/

  def self.valid_publication_status?(status)
    PUBLICATION_STATES.include? status
  end

  def default_logo_url
    ActionController::Base.helpers.asset_path("logo.default.png")
  end

  def default_banner_url
    ActionController::Base.helpers.asset_path("banner.default.png")
  end
end

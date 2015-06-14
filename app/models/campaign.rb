class Campaign < ActiveRecord::Base
  validates_presence_of :title, :details

  belongs_to :user

  has_attached_file :logo,
  :styles => { :medium => "300x300#", :thumb => "180x180#" },
  :default_url => "/images/:style/logo.default.png"

  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  has_attached_file :banner,
  :styles => { :large => "1200x300#", :thumb => "180x180#" },
  :default_url => "/images/:style/banner.default.png"

  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
end

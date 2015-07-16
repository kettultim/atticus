class Item::Image < ActiveRecord::Base
  belongs_to :item

  validates_presence_of :attachment

  has_attached_file(
    :attachment,
    styles: { medium: '300x300#', thumb: '180x180#' }
  )

  validates_attachment_content_type(
    :attachment,
    content_type: %r{\Aimage\/.*\Z}
  )

  delegate :url, to: :attachment
end

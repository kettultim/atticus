class Item < ActiveRecord::Base
  # Validations
  validates_presence_of :name, :user_id, :campaign_id, :description,
  :minimum_price, :shipping_fee, :payment_email, :quantity

  validates :minimum_price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10_000
  }

  validates :shipping_fee, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10_000
  }

  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10_000
  }

  validates :payment_email, email: true

  # Relations
  belongs_to :user
  belongs_to :campaign
  has_many :images, class_name: 'Item::Image', dependent: :destroy
  accepts_nested_attributes_for :images

  # Delegation
  delegate :title, to: :campaign, prefix: true

  def self.new_with_disclaimer(attrs = {})
    item = Item.new.extend(RequiresDisclaimer)
    item.assign_attributes(attrs)

    item
  end

  def has_image?
    image
  end

  def image
    images.first
  end

  def image_url(style = nil)
    image && image.url(style)
  end
end

class Item < ActiveRecord::Base
  # Validations
  validates_presence_of :name, :user_id, :campaign_id, :description,
  :minimum_price, :shipping_fee, :payment_email

  validates :minimum_price, inclusion: { in: 1..10_000 }
  validates :shipping_fee, inclusion: { in: 0..10_000 }
  validates :payment_email, email: true

  # Relations
  belongs_to :user

  belongs_to :campaign
  delegate :title, to: :campaign, prefix: true

  def self.new_with_disclaimer(attrs = {})
    item = Item.new.extend(RequiresDisclaimer)
    item.assign_attributes(attrs)

    item
  end
end

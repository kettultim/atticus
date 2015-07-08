class Item < ActiveRecord::Base
  validates_presence_of :name, :user_id, :campaign_id

  belongs_to :user

  belongs_to :campaign
  delegate :title, to: :campaign, prefix: true
end

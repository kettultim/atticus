class AddExpiresAndPublishedTimestampsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :published_at, :datetime
    add_column :campaigns, :expires_at, :datetime
  end
end

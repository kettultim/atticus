class AddDurationToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :duration, :integer
  end
end

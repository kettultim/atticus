class AddFundingGoalToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :funding_goal, :integer
  end
end

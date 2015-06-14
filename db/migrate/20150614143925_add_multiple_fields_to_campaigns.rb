class AddMultipleFieldsToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :details, :text
    add_column :campaigns, :allow_product_donations, :boolean
  end
end

class AddZipCodeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :zip_code, :string
  end
end

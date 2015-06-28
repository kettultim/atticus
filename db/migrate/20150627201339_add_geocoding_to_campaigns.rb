class AddGeocodingToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :latitude, :float
    add_column :campaigns, :longitude, :float
    add_column :campaigns, :city, :string
    add_column :campaigns, :state, :string
  end
end

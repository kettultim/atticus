class AddPublicationStatusToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :publication_status, :string
  end
end

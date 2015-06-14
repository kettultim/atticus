class AddAttachmentLogoToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :campaigns, :logo
  end
end

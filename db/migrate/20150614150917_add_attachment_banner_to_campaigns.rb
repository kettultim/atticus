class AddAttachmentBannerToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :campaigns, :banner
  end
end

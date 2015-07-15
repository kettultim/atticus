class AddAttachmentAttachmentToItemImages < ActiveRecord::Migration
  def self.up
    change_table :item_images do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :item_images, :attachment
  end
end

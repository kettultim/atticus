class AddFieldsToItems < ActiveRecord::Migration
  def change
    add_column :items, :description, :text
    add_column :items, :minimum_price, :integer
    add_column :items, :shipping_fee, :integer
    add_column :items, :payment_email, :string
  end
end

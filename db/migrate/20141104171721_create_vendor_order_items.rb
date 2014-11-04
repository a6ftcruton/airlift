class CreateVendorOrderItems < ActiveRecord::Migration
  def change
    create_table :vendor_order_items do |t|
      t.references :vendor_order
      t.references :item
      t.timestamps
    end
  end
end

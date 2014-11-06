class AddQuantityToVendorOrderItems < ActiveRecord::Migration
  def change
    add_column :vendor_order_items, :quantity, :integer
  end
end

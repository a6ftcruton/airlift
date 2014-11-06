class AddVendorIdToVendorOrders < ActiveRecord::Migration
  def change
    add_reference :vendor_orders, :vendor, index: true
  end
end

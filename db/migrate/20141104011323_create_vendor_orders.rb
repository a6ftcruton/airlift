class CreateVendorOrders < ActiveRecord::Migration
  def change
    create_table :vendor_orders do |t|
      t.belongs_to :order

      t.timestamps
    end
  end
end

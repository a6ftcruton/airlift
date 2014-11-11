class AddActiveToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :active, :boolean, default: true
  end
end

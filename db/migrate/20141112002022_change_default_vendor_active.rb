class ChangeDefaultVendorActive < ActiveRecord::Migration
  def change
    change_column :vendors, :active, :boolean, default: false
  end
end

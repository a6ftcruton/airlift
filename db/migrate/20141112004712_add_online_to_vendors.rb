class AddOnlineToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :online, :boolean, default: true
  end
end

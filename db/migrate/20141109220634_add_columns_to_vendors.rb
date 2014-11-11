class AddColumnsToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :street, :string
    add_column :vendors, :city, :string
    add_column :vendors, :zip, :string
  end
end

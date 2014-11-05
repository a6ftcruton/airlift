class AddVendorIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :vendor, index: true
  end
end

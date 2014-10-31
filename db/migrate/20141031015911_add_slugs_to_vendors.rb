class AddSlugsToVendors < ActiveRecord::Migration
  def change
    Vendor.find_each(&:save)
  end
end

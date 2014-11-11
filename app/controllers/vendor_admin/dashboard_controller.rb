class VendorAdmin::DashboardController < VendorAdmin::BaseController

  def index
    if current_user.is?('super_admin')
      @items = Item.all
    else
      @vendor = Vendor.find(current_user.vendor_id)
      @items = @vendor.items
    end
  end
end

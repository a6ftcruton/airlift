class VendorAdmin::DashboardController < VendorAdmin::BaseController

  def index
    if current_user.is?('super_admin')
      @items = Item.where(vendor_id: params['format'])
      @vendor = Vendor.find(params['format'])
    else
      @vendor = Vendor.find(current_user.vendor_id)
      @items = @vendor.items
    end
  end
end

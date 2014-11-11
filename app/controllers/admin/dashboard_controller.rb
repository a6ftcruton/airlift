class Admin::DashboardController < Admin::BaseController

  def index
    if current_user.is?('admin')
      @items = Item.all
    else
      @vendor = Vendor.find(current_user.vendor_id)
      @items = @vendor.items
    end
  end
end

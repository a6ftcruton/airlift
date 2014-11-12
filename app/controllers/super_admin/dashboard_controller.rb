class SuperAdmin::DashboardController < SuperAdmin::BaseController

  def index
    @vendors = Vendor.where(active: true)
    @categories = Category.all
    @users = User.all
  end
end

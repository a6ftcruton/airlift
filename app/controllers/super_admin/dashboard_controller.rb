class SuperAdmin::DashboardController < SuperAdmin::BaseController

  def index
    @vendors = Vendor.where(active: true)
    p "--------------"
    p @vendors
    @categories = Category.all
    @users = User.all
  end
end

class SuperAdmin::DashboardController < SuperAdmin::BaseController

  def index
      @vendors = Vendor.all
      @categories = Category.all
      @users = User.all
  end
end

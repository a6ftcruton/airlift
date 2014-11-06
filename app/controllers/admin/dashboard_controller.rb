class Admin::DashboardController < Admin::BaseController

  def index
    @items = Item.accessible_by(current_ability)
  end

  #review Items by accessibility; can only see items per vendor id
  #only show orders for the vendor


end

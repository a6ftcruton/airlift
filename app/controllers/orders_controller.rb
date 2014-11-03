class OrdersController < ApplicationController
	load_and_authorize_resource
  after_create :vendor_orders
  helper_method :find_vendor_name


	def new
		@order = Order.new
	end

	def index
	end

	def create
    order = Order.new(order_params)
    @vendor_orders = order.populate(cart, current_user)
    cart.clear

		if order.save
			flash[:notice] = "Your order has been successfully created!"
			redirect_to order
		else
			flash[:notice] = "Error placing order"
			redirect_to :back
		end
	end

	def show
		@order = Order.includes(:items).find(params[:id])
    @vendors = @order.group_by_vendor
	end

	private

	def order_params
		params.require(:order).permit(:street_number, :street, :city, :state, :zip, :exchange, :status)
	end

 def find_vendor_name(vendor_id)
   Vendor.where(id: vendor_id).first.name
 end

 def vendor_orders
   @vendor_orders.group_by_vendor
   @vendor_orders.each do |vendor, items|

 end

end


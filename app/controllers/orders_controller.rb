class OrdersController < ApplicationController
	load_and_authorize_resource

	def new
		@order = Order.new
		@order.status = "ordered"
	end

	def index

	end

	def create
		order = Order.new(order_params)

		cart = Cart.build(session[:cart])

		cart.flatten.each do |item|
			order.items << item
		end

		order.user = current_user

		if order.save
			flash[:notice] = "Your order has been successfully created!"
			redirect_to order
		else
			flash[:notice] = "Error placing order"
			redirect_to :back
		end
	end

	def show
		@order = Order.find(params[:id])
		@items = @order.items.group_by(&:id).values
	end

	private

	def order_params
		params.require(:order).permit(:street_number, :street, :city, :state, :zip, :exchange, :status)
	end

end
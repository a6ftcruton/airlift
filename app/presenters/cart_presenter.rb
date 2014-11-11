class CartPresenter
	attr_reader :user

	def initialize(user)
		@user = user
	end

  def choose_exchange
    user ? "Get Your Supplies" : "Login To Checkout"
  end

	def checkout_label
		user ? "Checkout" : "Login To Checkout"
	end

	def checkout_path
		user ? :new_order : :login
	end
end

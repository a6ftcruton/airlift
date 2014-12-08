class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :back
      if cart.items.empty?
        redirect_to correct_destination(user)
      else
        redirect_to cart_edit_path
      end
    else
      flash[:errors] = "Invalid Login"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logout Successful"
    redirect_to root_path
  end

  private

  def correct_destination(user)
    if user.is?('super_admin')
      super_admin_path
    elsif user.is?('vendor_admin')
      vendor_admin_path
    else
      items_path
    end
  end

end

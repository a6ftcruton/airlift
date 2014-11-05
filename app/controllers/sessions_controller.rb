class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to correct_destination(user)
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
    if user.is?('admin') && user.vendor
      admin_path(user.vendor.slug)
    elsif user.is?('admin')
      platform_admin_path
    else
      vendor_path(user.vendor.slug)
    end
  end

end

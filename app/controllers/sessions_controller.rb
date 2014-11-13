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
      # render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logout Successful"
    redirect_to root_path
  end

  private

  # user.is?('admin') ? admin_path : items_path
  def correct_destination(user)
    if user.is?('admin') || user.is?('store_admin')
      admin_path
    else
      items_path
    end
  end

end

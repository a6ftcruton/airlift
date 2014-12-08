class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from CanCan::AccessDenied do | exception |
    redirect_to login_url, alert: exception.message
  end

  after_filter :save_cart_in_session

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def set_time_zone
      Time.zone = current_user.time_zone
    end

    def cart
      @cart ||= Cart.new(session[:cart])
    end
    helper_method :cart

    def save_cart_in_session
      session[:cart] = cart.to_a
    end

end

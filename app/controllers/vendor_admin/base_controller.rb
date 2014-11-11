class VendorAdmin::BaseController < ApplicationController
  before_filter :verify_admin

  private

    def verify_admin
      unless current_user && current_user.role == 'super_admin' || current_user && current_user.role == 'vendor_admin'
        flash[:error] = "You are not authorized to access this page."
        redirect_to items_path
      end
    end
end

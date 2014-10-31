class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @categories = Category.all
    @vendor = Vendor.friendly.find(params[:id])
  end
end

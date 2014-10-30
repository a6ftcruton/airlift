class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @categories = Category.all
    @vendor = Vendor.find(params[:id])
  end
end

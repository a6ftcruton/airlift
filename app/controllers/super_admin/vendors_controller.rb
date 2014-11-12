class SuperAdmin::VendorsController < SuperAdmin::BaseController
  before_action :set_vendor, except: [:index, :new, :create]

  def index
    @vendors = Vendor.where(active: true)
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(user_params)
    if @vendor.save
      redirect_to super_admin_vendors_path
      flash[:notice] = "You successfully created vendor #{@vendor.name}!"
    else
      render :new
    end
  end

  def edit
    @vendor
  end

  def show
  end

  def update
    # binding.pry
    if @vendor.update(vendor_params)
      flash[:notice] = "Your account information has been successfully updated!"
      redirect_to super_admin_path
    else
      redirect_to :back
      flash[:notice] = "Error saving your new information."
    end
  end

  def destroy
    @vendor.destroy
    redirect_to super_admin_path
  end

  private

    def vendor_params
      params.require(:vendor).permit(:name, :description, :active, :online)
    end

    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

end

class SuperAdmin::VendorsController < SuperAdmin::BaseController
  before_action :set_vendor, except: [:index, :new, :create]

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(user_params)
    if @user.save
      redirect_to super_admin_users_path
      flash[:notice] = "You successfully created vendor #{@vendor.name}!"
    else
      render :new
    end
  end

  def show
  end

  def update
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

  def edit
    render 'edit_vendor'
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :role)
    end

    def set_user
      @user = User.find(params[:id])
    end

end

class VendorAdmin::UsersController < VendorAdmin::BaseController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.where(vendor_id: current_user.vendor_id.to_s, role: "vendor_admin")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to vendor_admin_users_path
      flash[:notice] = "You successfully created #{@user.role} #{@user.full_name}!"
    else
      render :new
    end
  end

  def show
  end

  def update
    old_role = @user.role
    @user.update(user_params)
    users = User.where(vendor_id: current_user.vendor_id.to_s, role: "vendor_admin")
    if users.count == 0
      @user.update(role: old_role)
      flash[:notice] = "You must retain at least one vendor admin; role change undone!"
      redirect_to :back
    elsif @user.update(user_params) && users.count >= 1
      flash[:notice] = "Your account information has been successfully updated!"
      redirect_to vendor_admin_path
    else
      redirect_to :back
      flash[:notice] = "Error saving your new information."
    end
  end

  def destroy
    @user.destroy
    redirect_to vendor_admin_path
  end

  def edit
    render 'edit_user_role'
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :role)
    end

    def set_user
      @user = User.find(params[:id])
    end

end

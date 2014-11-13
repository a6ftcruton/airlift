class Admin::ItemsController < Admin::BaseController
  before_action :set_item, except: [:new, :create]

  def new
    @item = Item.new
    @categories = Category.all
  end

  def show
    @categories = @item.categories
  end

  def edit
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    @categories = params[:categories] || []
    @categories.each do |category|
      category = Category.find(category)
      @item.categories << category
    end
    if @item.save
      redirect_to admin_path
      flash[:notice] = "Your item has been successfully added to the menu!"
    else
      redirect_to :back
      flash[:notice] = "All fields are required to create a menu item, including category."
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_path
  end

  def update
    @categories = params[:categories] || []
    @item.categories.clear
    @categories.each do |category|
      category = Category.find(category)
      @item.categories << category
    end

    if @item.update(item_params)
      flash[:notice] = "Your item has been successfully updated!"
      redirect_to admin_item_path(@item)
    else
      redirect_to :back
      flash[:notice] = "Error saving item."
    end
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :price, :image, :category, :active)
    end

    def set_item
      @item = Item.find(params[:id])
    end

end

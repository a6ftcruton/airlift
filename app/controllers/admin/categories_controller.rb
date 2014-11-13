class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@items = Item.all
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Your category has been successfully created!"
			redirect_to admin_path
		else
			flash[:notice] = "Error saving category"
			redirect_to :back
		end
	end

	def update
		@category.update(category_params)
		redirect_to admin_path
	end

	def destroy
		@category.destroy
		redirect_to admin_categories_url
	end

	private

    def category_params
      params.require(:category).permit(:title, :description)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end

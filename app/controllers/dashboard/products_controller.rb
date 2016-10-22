class Dashboard::ProductsController < ApplicationController
  layout 'dashboard'

  def index
  	@products = current_user.products.order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
  	if current_user.products.create(product_params)
      flash[:success]= "Product created successfully"
  		redirect_to dashboard_products_path
  	end
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price_cents, :quantity, :description, :product_image, :user_id).merge(district_id: current_user.district.id)
  	end
end

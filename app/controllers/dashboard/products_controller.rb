class Dashboard::ProductsController < ApplicationController
  layout 'dashboard'

  def index
  	@products = shop.products.order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
  	if shop.products.create(product_params)
      flash[:success]= "Product created successfully"
  		redirect_to dashboard_products_path
  	end
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price_cents, :quantity, :description, :product_image, :shop_id)
  	end
end

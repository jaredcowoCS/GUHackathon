class ProductsController < ApplicationController
  layout :layout, except: [:show]
  
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
  		redirect_to dashboard_path
  	end
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price, :quantity, :description, :product_image, :shop_id)
  	end
end

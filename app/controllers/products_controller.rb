class ProductsController < ApplicationController

  def index
  	@products = Product.order("created_at DESC").all
  end

  def show
    @product = Product.find(params[:id])
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price_cents, :quantity, :description, :product_image, :shop_id)
  	end
end

class ProductsController < ApplicationController

  def index
    @products = Product.paginate(:page => params[:page], :per_page => 12).order("created_at DESC")
  end

  def show
    @product = Product.find(params[:id])
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price_cents, :quantity, :description, :product_image, :shop_id)
  	end
end

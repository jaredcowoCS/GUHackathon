class ProductsController < ApplicationController
  def index
  end

  def new
  	@product = Product.new
  end

  def create
  	if Product.create(product_params)
  		redirect_to dashboard_path
  	end
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price, :quantity, :description).merge(shop_id: current_user.shop.id)
  	end
end

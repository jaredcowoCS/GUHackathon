class ProductsController < ApplicationController

  def index
    if params[:dst].present?
      @products = Product.where(district: params[:dst]).paginate(:page => params[:page], :per_page => 20).order("created_at DESC")
    else
    	@products = Product.paginate(:page => params[:page], :per_page => 20).order("created_at DESC")
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private	
  	def product_params
  		params.require(:product).permit(:name, :price_cents, :quantity, :description, :product_image, :shop_id)
  	end
end

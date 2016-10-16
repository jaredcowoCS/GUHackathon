class Dashboard::ShopsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    if Shop.create(shop_params)
      redirect_to root_path
    end
  end
  
  private
    def shop_params
      params.require(:shop).permit(:name, :address, :description).merge(user_id: current_user.id)
    end
end

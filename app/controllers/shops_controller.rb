class ShopsController < ApplicationController
  def index
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    if Shop.create(shop_params)
      redirect_to dashboard_path
    end
  end
  
  private
    def shop_params
      params.require(:shop).permit(:name).merge(user_id: current_user.id)
    end
end

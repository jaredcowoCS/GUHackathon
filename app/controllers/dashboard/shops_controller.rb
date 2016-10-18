class Dashboard::ShopsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    @shop = Shop.new
  end
  
  # Create a shop instance and also a base balance instance $0.0
  def create
    if Shop.create(shop_params)
      current_user.create_balance
      flash[:success] = "Your shop has been created"
      redirect_to root_path
    end
  end
  
  private
    def shop_params
      params.require(:shop).permit(:name, :address, :description).merge(user_id: current_user.id)
    end
end

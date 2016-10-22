class SellersController < ApplicationController
  def index
  	@sellers = User.order("created_at DESC").limit(20)
  end

  def show
  end
end

class ShopsController < ApplicationController
  def index
    @shops = Shop.order("created_at DESC").all
  end

  def show
  end
  
end

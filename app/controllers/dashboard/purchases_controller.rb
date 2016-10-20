class Dashboard::PurchasesController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  
  def index
  	@purchases = Purchase.where(buyer: current_user).order("created_at DESC").all
  	@sold = Purchase.where(seller: current_user).order("created_at DESC").all
  end
end

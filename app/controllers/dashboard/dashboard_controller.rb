class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout :layout
  
  def index
  end

  def shop
  end

end

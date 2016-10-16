class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout :layout
  
  def index
  end
end

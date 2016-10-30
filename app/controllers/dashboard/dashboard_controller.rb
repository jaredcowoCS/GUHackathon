class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_user!
  layout :layout
  
  def index
  end

  def account
  end

  # BPMS staff
  def staff
 	@users = User.where(role: 1).order("created_at DESC")
  end

end

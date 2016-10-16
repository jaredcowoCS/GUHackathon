class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  # Returns current user's shop 
  def shop
  	current_user.shop
  end

  def layout
	  user_signed_in? ? 'dashboard' : 'application'
  end

end

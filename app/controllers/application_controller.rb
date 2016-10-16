class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Returns current user's shop 
  def shop
  	current_user.shop
  end

  def layout
	  user_signed_in? ? 'dashboard' : 'application'
  end

end

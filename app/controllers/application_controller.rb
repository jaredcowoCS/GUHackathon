class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def layout
	  user_signed_in? ? 'dashboard' : 'application'
  end

  def role
  	current_user.role
  end
end

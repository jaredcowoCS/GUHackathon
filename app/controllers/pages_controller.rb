class PagesController < ApplicationController
  before_action :allow_home

  def home
  end

  def features
  end

  private
	  def allow_home
	  	if user_signed_in? && role == "delivery"
	  		redirect_to dashboard_path
	  	end
	  end

end

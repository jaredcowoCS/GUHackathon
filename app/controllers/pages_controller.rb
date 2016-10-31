class PagesController < ApplicationController
  before_action :allow_home

  def home
    location_info = request.location
    @near_products = Product.near([location_info.latitude, location_info.longitude], 50).limit(4)
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

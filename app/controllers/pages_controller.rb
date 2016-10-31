class PagesController < ApplicationController
  before_action :allow_home

  def home
    @near_products = Product.near(current_user.address).limit(4)
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

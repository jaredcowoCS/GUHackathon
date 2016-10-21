class PagesController < ApplicationController
  def home
  end

  def search
  	@products = Product.search(params[:search])
  end

end

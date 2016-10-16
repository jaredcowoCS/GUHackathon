class PurchasesController < ApplicationController
	before_action :authenticate_user!

	def new
		@product = Product.find(params[:product_id])
		@purchase = Purchase.new
	end

	def create
		@code = Code.where(code: params[:purchase][:code]).first 
		if @code.present?
			if @code.value_cents >= Product.find(params[:product_id]).price_cents
				flash[:success] = "Purchase processed"
				redirect_to dashboard_path
			else
				flash[:danger] = "You don't have enough credits to make that purchase"
				redirect_to new_product_purchase_path(Product.find(params[:product_id]))
			end
		else
			flash[:danger] = "Code is invalid"
			redirect_to new_product_purchase_path(Product.find(params[:product_id]))
		end
	end

end

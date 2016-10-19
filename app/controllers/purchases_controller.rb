class PurchasesController < ApplicationController
	before_action :authenticate_user!

	def new
		@product = Product.find(params[:product_id])
		@purchase = Purchase.new
	end

	def create
		@product = Product.find(params[:product_id])
		if current_user.balance.amount_cents >= @product.price_cents
			amount = current_user.balance.amount_cents - @product.price_cents
			current_user.balance.update_attribute(:amount_cents, amount)
<<<<<<< HEAD
			@purchase = @product.purchases.new
			@purchase.seller = @product.user
			@purchase.buyer = current_user
			if @purchase.save
				# This is where the transaction between the bank, seller,and buyer would take place
				flash[:success] = "Payment processed, expect contact from seller soon"
				redirect_to root_path
			else
				flash[:danger] = "Something went wrong, try again"
				redirect_to root_path
			end
=======
			@product.purchases.create
			flash[:success] = "Payment processed, expect contact from seller soon"
			redirect_to root_path
>>>>>>> 990cccc138d3c4def06c748c4ff23dd75e4597e7
		else
			flash[:danger] = "You dont have enough eBalance to make purchase"
			redirect_to root_path
		end
	end

end

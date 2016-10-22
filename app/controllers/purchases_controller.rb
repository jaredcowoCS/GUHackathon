class PurchasesController < ApplicationController
	before_action :authenticate_user!

	def new
		@product = Product.find(params[:product_id])
		@purchase = Purchase.new
	end

	def create
		@product = Product.find(params[:product_id])
		if current_user.balance.amount_cents >= @product.price_cents
			# Update buyer and seller balance
			# This is where the transaction between the bank, seller, and buyer will take place
			buyer_amount = current_user.balance.amount_cents - @product.price_cents
			current_user.balance.update_attribute(:amount_cents, buyer_amount)
			seller_amount = User.find(@product.user).balance.amount_cents += @product.price_cents
			User.find(@product.user).balance.update_attribute(:amount_cents, seller_amount)

			@product.decrement!(:quantity, 1)

			# Save purchase details
			@purchase = @product.purchases.new
			@purchase.seller = @product.user
			@purchase.buyer = current_user
			if @purchase.save
				flash[:success] = "Payment processed, expect contact from seller soon"
				redirect_to root_path
			else
				flash[:danger] = "Something went wrong, try again"
				redirect_to root_path
			end
		else
			flash[:danger] = "You dont have enough eBalance to make purchase"
			redirect_to root_path
		end
	end

end

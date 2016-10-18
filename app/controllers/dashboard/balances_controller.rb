class Dashboard::BalancesController < ApplicationController
	def update
		@code = params[:code]
		# Check if a giftcard code exists with the value of params[:code]
		# If yes, get the cash value from that giftcard
		# Update the current user balance with the amount from the returned code
		# Destroy the used giftcard  
		redirect_to root_path
	end
end

class BalancesController < ApplicationController
	# Update user's current balance
	def update
		# NOTE: Performance Heavy, use indexes as alternative
		@code = Code.where(code: params[:codes][:code]).first 

		if @code.present?
			if current_user.balance.update_attribute(:amount_cents, current_user.balance.amount_cents += @code.value_cents)
				@code.destroy
				flash[:success] = "Gift card code accepted"
				redirect_to dashboard_path
			end
		else
			flash[:danger] = "Code is invalid"
			redirect_to dashboard_path
		end
	end
end

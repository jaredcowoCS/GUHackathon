class Dashboard::UsersController < ApplicationController
  def update
  	if current_user.update_attribute(:profile_image, params[:profile_image])
  		flash[:success] = "Profile updated"
  		redirect_to dashboard_account_path
  	end
  end
end

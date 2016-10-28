class Dashboard::UsersController < ApplicationController
  def update
  	if User.find(current_user).update_attribute(:profile_image, params[:user][:profile_image])
  		flash[:success] = "Profile updated"
  		redirect_to dashboard_account_path
  	end
  end
end

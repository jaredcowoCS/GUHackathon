class RegistrationsController < Devise::RegistrationsController

  def create
    super # this calls Devise::RegistrationsController#create as usual
    # after creating a new user, create a profile that has
    # the profile.user_id field set to the user_id of the user jsut created
    if resource.save
        # creating base balance instance associated to user
        resource.create_balance
    end
  end

  private

	  def sign_up_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :district_id)
	  end

	  def account_update_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :district_id)
	  end

end
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

end
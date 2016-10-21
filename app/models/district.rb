class District < ActiveRecord::Base
	has_many :users

	def district_name
    "#{name}"
  	end

end

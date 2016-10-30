class Purchase < ActiveRecord::Base
  belongs_to :code
  belongs_to :product
  
  belongs_to :seller, :class_name => "User"
  belongs_to :buyer, :class_name => "User"

  has_one :order 
end

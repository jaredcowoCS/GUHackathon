class Purchase < ActiveRecord::Base
  belongs_to :code
  belongs_to :product
end

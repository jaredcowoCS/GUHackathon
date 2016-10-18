class Balance < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user

  monetize :amount_cents
end

class Order < ActiveRecord::Base
  belongs_to :purchase
end

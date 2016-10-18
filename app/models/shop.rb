class Shop < ActiveRecord::Base
  belongs_to :user
  
  has_many :products, dependent: :destroy

  has_one :balance, dependent: :destroy
end

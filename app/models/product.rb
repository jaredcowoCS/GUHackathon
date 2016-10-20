class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
	
  has_many :purchases

  belongs_to :user
  
  monetize :price_cents
end

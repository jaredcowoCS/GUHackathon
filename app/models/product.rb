class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
	
  belongs_to :user
  has_many :purchases

  monetize :price_cents
end

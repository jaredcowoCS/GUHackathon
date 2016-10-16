class Product < ActiveRecord::Base
  belongs_to :shop
  has_many :purchases

  mount_uploader :product_image, ProductImageUploader

  monetize :price_cents
end

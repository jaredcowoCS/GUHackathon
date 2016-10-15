class Product < ActiveRecord::Base
  belongs_to :shop

  mount_uploader :product_image, ProductImageUploader
end

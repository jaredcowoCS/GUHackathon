class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
	
  has_many :purchases, dependent: :destroy

  belongs_to :user
  belongs_to :category
  belongs_to :district

  monetize :price_cents

  geocoded_by :address
  after_validation :geocode  , :if => :address_changed?

end

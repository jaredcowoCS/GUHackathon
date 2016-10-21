class Product < ActiveRecord::Base
  mount_uploader :product_image, ProductImageUploader
	
  has_many :purchases, dependent: :destroy

  belongs_to :user
  belongs_to :district

  monetize :price_cents

  def self.search(search)
  	if search
		where("name LIKE ?", "%#{search}%").order("created_at DESC").limit(12)
  	else
		where.not(quantity: 0).order("created_at DESC").limit(6)
  	end
  end

end

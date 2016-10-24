class User < ActiveRecord::Base
  mount_uploader :product_image, ProfileImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :balance

  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy

  belongs_to :district
end

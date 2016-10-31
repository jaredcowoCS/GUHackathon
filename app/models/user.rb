class User < ActiveRecord::Base
  mount_uploader :profile_image, ProfileImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :balance

  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy

  belongs_to :district

  geocoded_by :address
  after_validation :geocode  , :if => :address_changed?

  # user roles structure, default - seller
  enum role: [:normal, :delivery, :admin]
  # sets default role only if its a new record(i.e. object does not exist yet)
  after_initialize :set_default_role, :if => :new_record?

   # set default role for user
  def set_default_role
  	self.role ||= :normal
  end
end


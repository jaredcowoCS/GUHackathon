class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :balance

  has_many :products, dependent: :destroy
  has_many :purchases, dependent: :destroy

  belongs_to :district
end

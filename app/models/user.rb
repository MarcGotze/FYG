class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLE = ["musician", "owner"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :venues, dependent: :destroy
  validates :email, :password, :username, :avatar, presence: true
  has_one_attached :avatar
end

class Venue < ApplicationRecord
  belongs_to :users
  has_many :bookings
  validates :overwiew, :name, :address, presence: true
end

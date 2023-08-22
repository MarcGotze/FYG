class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :overview, :name, :address, presence: true
end

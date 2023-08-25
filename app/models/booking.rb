class Booking < ApplicationRecord
  belongs_to :musician, class_name: "User", foreign_key: 'user_id'
  belongs_to :venue
  validates :start_date, :end_date, presence: true
end

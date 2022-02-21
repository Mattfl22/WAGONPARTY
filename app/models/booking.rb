class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :wagon

  validates :start_date, :end_date, :start_location, :end_location, :status, presence: true
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :wagon

  validates :start_date, :start_location, presence: true
end

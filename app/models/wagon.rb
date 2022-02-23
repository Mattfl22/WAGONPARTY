class Wagon < ApplicationRecord
  belongs_to :user
  has_many :bookings
<<<<<<< HEAD
  has_one_attached :photo
=======
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?
>>>>>>> aedebf91dbed0727077a7cbea1fb638420f97695
end

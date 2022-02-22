class RemoveEndDateEndLocationFromWagons < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :end_date, :string
    remove_column :bookings, :end_location, :string
  end
end

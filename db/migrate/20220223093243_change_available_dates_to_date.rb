class ChangeAvailableDatesToDate < ActiveRecord::Migration[6.1]
  def change
    add_column :wagons, :latitude, :float
    add_column :wagons, :longitude, :float
    add_column :wagons, :location, :string
  end
end

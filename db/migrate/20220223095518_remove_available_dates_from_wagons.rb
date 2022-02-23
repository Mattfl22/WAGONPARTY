class RemoveAvailableDatesFromWagons < ActiveRecord::Migration[6.1]
  def change
    remove_column :wagons, :available_dates, :string
  end
end

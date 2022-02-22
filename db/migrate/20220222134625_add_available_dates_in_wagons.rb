class AddAvailableDatesInWagons < ActiveRecord::Migration[6.1]
  def change
    add_column :wagons, :available_dates, :date
  end
end

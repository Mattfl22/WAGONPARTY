class AddAvailableDatesInWagons < ActiveRecord::Migration[6.1]
  def change
    add_column :wagons, :dates, :date
  end
end

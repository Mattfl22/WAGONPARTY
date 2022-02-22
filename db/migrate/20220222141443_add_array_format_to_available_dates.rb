class AddArrayFormatToAvailableDates < ActiveRecord::Migration[6.1]
  def change
    remove_column :wagons, :available_dates
    add_column :wagons, :available_dates, :string, array: true, default: []
  end
end

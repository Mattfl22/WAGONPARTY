class AddArrayFormatToAvailableDates < ActiveRecord::Migration[6.1]
  def change
    remove_column :wagons, :dates
    add_column :wagons, :dates, :string, array: true, default: []
  end
end

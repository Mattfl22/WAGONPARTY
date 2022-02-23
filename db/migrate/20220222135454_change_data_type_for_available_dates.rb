class ChangeDataTypeForAvailableDates < ActiveRecord::Migration[6.1]
  def change
    remove_column :wagons, :dates, :date
    add_column :wagons, :dates, :string
  end
end

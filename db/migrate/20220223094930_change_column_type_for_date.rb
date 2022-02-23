class ChangeColumnTypeForDate < ActiveRecord::Migration[6.1]
  def change
    change_column :wagons, :available_dates, :string, array: true, default: []
  end
end

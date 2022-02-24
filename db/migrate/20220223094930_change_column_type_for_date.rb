class ChangeColumnTypeForDate < ActiveRecord::Migration[6.1]
  def change
    change_column :wagons, :dates, :string, array: true, default: []
  end
end

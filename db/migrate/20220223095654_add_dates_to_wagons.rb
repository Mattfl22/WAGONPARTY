class AddDatesToWagons < ActiveRecord::Migration[6.1]
  def change
    add_column :wagons, :dates, :string, array: true, default: []
  end
end

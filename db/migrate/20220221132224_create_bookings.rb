class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wagon, null: false, foreign_key: true
      t.string :start_date
      t.string :end_date
      t.string :start_location
      t.string :end_location
      t.string :status
      t.float :rating
      t.text :comment

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time
      t.integer :total_price
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :parking_spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end

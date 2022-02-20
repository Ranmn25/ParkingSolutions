class CreateParkingSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :parking_spots do |t|
      t.string :title
      t.string :address
      t.text :description
      t.integer :price_per_hour
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

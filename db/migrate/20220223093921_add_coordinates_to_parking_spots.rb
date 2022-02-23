class AddCoordinatesToParkingSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :parking_spots, :latitude, :float
    add_column :parking_spots, :longitude, :float
  end
end

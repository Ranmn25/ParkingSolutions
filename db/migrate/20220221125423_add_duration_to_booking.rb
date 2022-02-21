class AddDurationToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :duration, :float
  end
end

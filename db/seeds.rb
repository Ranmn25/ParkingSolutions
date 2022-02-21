# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
ParkingSpot.destroy_all

puts "Creating movies..."
parking1 = { title: "Wonderful parkingspot", user_id: 1 }
parking2 = { title: "Fantastic parkingspot", user_id: 1 }
parking3 = { title: "Perfect parkingspot", user_id: 1 }
parking4 = { title: "Amazing parkingspot", user_id: 1 }

[parking1, parking2, parking3, parking4].each do |attributes|
  parking = ParkingSpot.create!(attributes)
  puts "Created #{parking.title}"
end

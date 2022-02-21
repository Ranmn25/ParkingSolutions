# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
ParkingSpot.destroy_all

user = User.create!(email: "modeoasis1@gmail.com", password: "123456")
puts "Creating movies..."
parking1 = { title: "Wonderful parkingspot", user: user }
parking2 = { title: "Fantastic parkingspot", user: user }
parking3 = { title: "Perfect parkingspot", user: user }
parking4 = { title: "Amazing parkingspot", user: user }

[parking1, parking2, parking3, parking4].each do |attributes|
  parking = ParkingSpot.create!(attributes)
  puts "Created #{parking.title}"
end

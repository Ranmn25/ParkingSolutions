# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
ParkingSpot.destroy_all
User.destroy_all

user = User.create!(email: "modeoasis1@gmail.com", password: "123456")
puts "Creating parking spots..."
parking1 = { title: "Wonderful parkingspot", user: user }
parking2 = { title: "Fantastic parkingspot", user: user }
parking3 = { title: "Perfect parkingspot", user: user }
parking4 = { title: "Amazing parkingspot", user: user }

parking_spot1 = ParkingSpot.create!(parking1)
parking_spot2 = ParkingSpot.create!(parking2)
parking_spot3 = ParkingSpot.create!(parking3)
parking_spot4 = ParkingSpot.create!(parking4)

file1 = URI.open('https://images.unsplash.com/photo-1522318548694-a0b65c40b0c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fHBhcmtpbmclMjBzcGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
file2 = URI.open('https://images.unsplash.com/photo-1577059023365-cb3d8a8e1e9c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fHBhcmtpbmclMjBzcGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
file3 = URI.open('https://images.unsplash.com/photo-1534791108293-e080c7d856e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fHBhcmtpbmclMjBzcGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')
file4 = URI.open('https://images.unsplash.com/photo-1583073491690-3adcab1b7bdc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=')

parking_spot1.photo.attach(io: file1, filename: 'image1.png', content_type: 'image/png')
parking_spot2.photo.attach(io: file2, filename: 'image2.png', content_type: 'image/png')
parking_spot3.photo.attach(io: file3, filename: 'image3.png', content_type: 'image/png')
parking_spot4.photo.attach(io: file4, filename: 'image4.png', content_type: 'image/png')

# [parking1, parking2, parking3, parking4].each do |attributes|
#   parking = ParkingSpot.create!(attributes)
#   puts "Created #{parking.title}"
# end

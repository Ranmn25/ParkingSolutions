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
puts "Creating movies..."
file1 = URI.open('https://images.unsplash.com/photo-1618849985478-d1cd0eba25f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTd8NjEwNjUwfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60')
file2 = URI.open('https://images.unsplash.com/photo-1493780758133-e5cfb0d00354?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80')
file3 = URI.open('https://images.unsplash.com/photo-1467840090898-5b940a807822?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80')
file4 = URI.open('https://images.unsplash.com/photo-1464851707681-f9d5fdaccea8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHBhcmtpbmclMjBzcGFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60')

parking1 = { title: "Wonderful parkingspot", user: user }
parking2 = { title: "Fantastic parkingspot", user: user }
parking3 = { title: "Perfect parkingspot", user: user }
parking4 = { title: "Amazing parkingspot", user: user }

[parking1, parking2, parking3, parking4].each do |attributes|
  parking = ParkingSpot.create!(attributes)
  # parking.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "Created #{parking.title}"
end
# parking1.photo.attach(io: file1, filename: 'nes1.jpg', content_type: 'image/jpg')
# parking2.photo.attach(io: file2, filename: 'nes2.jpg', content_type: 'image/jpg')
# parking3.photo.attach(io: file3, filename: 'nes3.jpg', content_type: 'image/jpg')
# parking4.photo.attach(io: file4, filename: 'nes4.jpg', content_type: 'image/jpg')
parking1.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/parking1.jpg')),
  filename: 'parking1.jpg',
  content_type: 'image/jpg'
)

parking2.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/parking1.jpg')),
  filename: 'parking2.jpg',
  content_type: 'image/jpg'
)

parking3.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/parking1.jpg')),
  filename: 'parking1.jpg',
  content_type: 'image/jpg'
)

parking4.photo.attach(
  io: File.open(Rails.root.join('app/assets/images/parking1.jpg')),
  filename: 'parking1.jpg',
  content_type: 'image/jpg'
)

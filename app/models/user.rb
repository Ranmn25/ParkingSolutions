class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :parking_spots
  has_many :bookings
  has_many :received_bookings, through: :parking_spots, source: :bookings
end

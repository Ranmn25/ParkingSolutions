class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking_spot

  # def initialize(attributes = {})
  #   @status = attributes[:status] || 'pending'
  # end
end

class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :update]

  def index
    @applied_bookings = current_user.bookings
    @received_bookings = current_user.received_bookings
  end

  def show
  end

  def new
    @booking = Booking.new
    @parking_spot = ParkingSpot.find(params[:parking_spot_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.parking_spot = ParkingSpot.find(params[:parking_spot_id])
    @booking.user = current_user
    @booking.status = 'pending'
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booked successfully.'
    else
      render :new
    end
  end

  def update
    @booking.status = params[:status]
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    find_booking
    @booking.destroy
    redirect_to parking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end

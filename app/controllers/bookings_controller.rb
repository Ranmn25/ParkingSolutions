class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]

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
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booked successfully.'
    else
      render :new
    end
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

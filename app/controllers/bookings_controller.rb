class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to booking_path(@booking)
  end

  def destroy
    find_booking
    @booking.destroy
    redirect_to parking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :time, :status)
  end

  def find_booking
    @booking = Booking.find(params[])
  end
end

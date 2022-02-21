class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
  end

  def show
    @parking_spot = ParkingSpot.find(params[:id])
  end

  def new
    @parking_spot = ParkingSpot.new
  end

  def create
    @parking_spot = ParkingSpot.new(parking_params)
    @parking_spot.user = current_user
    if @parking_spot.save
      redirect_to @parking_spot, notice: 'Parking spot was successfully created.'
    else
      render :new
    end
  end

  private

  def parking_params
    params.require(:parking_spot).permit(:title, :address, :descrition, :price_per_hour)
  end
end

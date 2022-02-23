class ParkingSpotsController < ApplicationController
  def index
    @parking_spots = ParkingSpot.all
  end

  def show
    @parking_spot = ParkingSpot.find(params[:id])
    @booking = Booking.new
  end

  def new
    @parking_spot = ParkingSpot.new
  end

  def create
    @parking_spot = ParkingSpot.new(parking_params)
    @parking_spot.user = current_user

    if @parking_spot.save
      redirect_to parking_spot_path(@parking_spot), notice: 'Parking spot was successfully created.'
    else
      render :new
    end
  end

  def edit
    @parking_spot = ParkingSpot.find params[:id]
  end

  def update
    @parking_spot = ParkingSpot.find params[:id]

    if @parking_spot.update parking_params
      redirect_to parking_spot_path(@parking_spot), notice: 'nice'
    else
      render :edit
    end
  end

  def destroy
    @parking_spot = ParkingSpot.find(params[:id])
    @parking_spot.destroy
    redirect_to parking_spots_path, notice: "Your parking_spot has been deleted"
  end

  private

  def parking_params
    params.require(:parking_spot).permit(:title, :address, :description, :price_per_hour, :photo)
  end
end

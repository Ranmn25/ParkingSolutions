class ParkingSpotsController < ApplicationController
  def index
    if params[:query].present?
      @parking_spots = ParkingSpot.search_by_title_and_address(params[:query])
    else
      @parking_spots = ParkingSpot.all
    end

    @markers = @parking_spots.geocoded.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude,
        info_window: render_to_string(partial: "info_window", locals: { parking: parking })
      }
    end
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

  def search
  end

  private

  def parking_params
    params.require(:parking_spot).permit(:title, :address, :description, :price_per_hour, :photo)
  end
end

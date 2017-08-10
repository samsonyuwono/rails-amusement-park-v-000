class RidesController < ApplicationController

  def new
    @ride = Ride.new(ride_params)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end

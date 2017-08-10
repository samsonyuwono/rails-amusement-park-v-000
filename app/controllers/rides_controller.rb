class RidesController < ApplicationController

  def new
    @ride = Ride.create(:user_id=> current_user.id, :attraction_id=> params[:attraction_id])
      if @ride.take_ride
      redirect_to user_path(current_user)
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end

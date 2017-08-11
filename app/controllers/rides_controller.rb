class RidesController < ApplicationController

  def new
    ride = Ride.create(
    user_id: current_user.id,
    attraction_id: params[:attraction_id]
    )
    flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
    redirect_to user_path(current_user)
  end

end

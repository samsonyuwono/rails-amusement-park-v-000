class AttractionsController < ApplicationController

  def index
    @user = current_user
    @attractions= Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params).save
    redirect_to attraction_path
  end

  def show
    @attraction = Attraction.find_by(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height, :id)
  end

end

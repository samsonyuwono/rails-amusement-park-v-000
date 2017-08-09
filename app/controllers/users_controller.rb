class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def show
    @user = User.find_by(params[:id])
    if session[:user_id]
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  end
end

class UsersController < ApplicationController
require 'pry'

  def index
    @users = User.all
  end

  def new
    @user= User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
    if session[:user_id]
      render :show
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :attraction_id, :admin)
  end
end

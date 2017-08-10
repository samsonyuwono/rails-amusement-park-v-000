class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user= (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if current_user.nil?
      redirect_to root_path
    end
  end

  def admin?
    current_user.admin
  end

  helper_method :current_user
  helper_method :admin?
end

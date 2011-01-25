class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def authenticate_user
    return if signed_in?
    redirect_to login_path
  end

  def is_admin?
    self.current_user && self.current_user.is_admin
  end

  def limit_to_admin
    return if is_admin?
    flash[:alert] = "You're not an admin user."
    redirect_to "/"
  end

end

class UsersController < ApplicationController
  before_filter :authenticate_user, :except => [:login]

  def login
    if signed_in?
      redirect_to books_path
    end
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    flash[:notice] = "Logged out."
    redirect_to login_path
  end
end

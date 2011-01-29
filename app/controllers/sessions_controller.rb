class SessionsController < ApplicationController
  skip_before_filter :authenticate_user, :except => [:destroy]

  def new
    if signed_in?
      redirect_to books_path
    elsif request.env.include? 'rack.auth'
      redirect_to :action => 'create'
    end
  end

  def create
    auth = request.env['rack.auth']
    unless user = User.find_from_auth_hash(auth)
      user = User.create_from_auth_hash(auth)
    end

    self.current_user = user
    redirect_to books_path
  end


  def destroy
    session[:user_id] = nil
    @current_user     = nil
    flash[:notice]    = "Logged out."
    redirect_to login_path
  end

  def failure
    render :text => "Authorization failed"
  end
end

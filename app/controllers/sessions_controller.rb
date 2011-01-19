# Code based on tutorial:
# http://blog.railsrumble.com/blog/2010/10/08/intridea-omniauth
#
class SessionsController < ApplicationController
  before_filter :authenticate_user, :except => [:create, :failure]

  def create
    auth = request.env['rack.auth']
    unless user = User.find_from_auth_hash(auth)
      user = User.create_from_auth_hash(auth)
    end

    self.current_user = user
    redirect_to books_path
  end

  def failure
    render :text => "Authorization failed"
  end
end

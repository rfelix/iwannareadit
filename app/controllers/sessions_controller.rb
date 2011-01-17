# Code based on tutorial:
# http://blog.railsrumble.com/blog/2010/10/08/intridea-omniauth
#
class SessionsController < ApplicationController
  before_filter :authenticate_user, :except => [:create, :failure]

  def create
    auth = request.env['rack.auth']
    unless @auth = Authorization.find_from_hash(auth)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authorization.create_from_hash(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    redirect_to books_path
  end

  def failure
    render :text => "Authorization failed"
  end
end

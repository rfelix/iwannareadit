class SessionsController < ApplicationController
  def create
    render :text => request.env['rack.auth'].inspect
  end

  def failure
    render :text => "Authorization failed"
  end
end

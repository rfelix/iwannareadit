class UsersController < ApplicationController
  def index
    @admins = User.admin.all
    @users  = User.normal.all
  end
end

class UsersController < ApplicationController
  before_filter :limit_to_admin

  def index
    @admins = User.admin
    @users  = User.normal
  end

  def promote
    @user = User.find(params[:id])
    @user.is_admin = true
    if @user.save
      flash[:notice] = "Promoted user."
    else
      flash[:alert]  = "Error promoting user."
    end
    redirect_to :action => 'index'
  end

  def demote
    @user = User.find(params[:id])
    @user.is_admin = false
    if @user.save
      flash[:notice] = "Demoted user."
    else
      flash[:alert]  = "Error depromoting user."
    end
    redirect_to :action => 'index'
  end

end

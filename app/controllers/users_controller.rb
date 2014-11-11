class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index    
    verify_admin
    @users = User.all
  end

  def show  
    verify_user(params[:id])
  end
end

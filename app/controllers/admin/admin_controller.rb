class Admin::AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    unless current_user.admin_role
      redirect_to :root, alert:'sorry, only admins may view that page'
    end
  end

end

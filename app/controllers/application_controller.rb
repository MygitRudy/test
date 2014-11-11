class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def after_sign_in_path_for(resource) #resource refers to the current user
    if resource.admin_role?  #
     # return admin_path
     # return profile_path

    end
  end
  
  private
  #this method checks if the user trying to access a given address is in fact who they claim to, or otherwise an admin.  deny access otherwise.  Note that the @user should be returned no redirects occur.
  def verify_user(user_id)
    if User.exists?(id:user_id)
      @user = User.find(user_id)
      unless @user == current_user || current_user.admin_role
        redirect_to user_path(current_user), alert:'inaccessible'
      end
    else
      redirect_to user_path(current_user), alert:'inaccessible'
    end
  end
  
  #checks if a guy is an admin, and redirect somewhere else if not
  def verify_admin
    unless current_user && current_user.admin_role
      redirect_to user_path(current_user), alert:'inaccessible'
    end
  end
end

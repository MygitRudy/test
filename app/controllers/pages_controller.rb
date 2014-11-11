class PagesController < ApplicationController
	def home
	end
	def gallery
	end
  	def about
  	end
  	def profile
      if current_user
        redirect_to :user
      else
        redirect_to :new_user_registration, alert:'you must be registered to view that page'
      end
  	end
  	def manage
      unless current_user && current_user.admin_role
        redirect_to :root, alert:'sorry, only admins may view this page'
      end
      redirect_to :users
  	end
end

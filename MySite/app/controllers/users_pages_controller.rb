class UsersPagesController < ApplicationController

	def index
		@users = User.all
	end

	def show
		if current_user
		end
	end

	def admin
		unless current_user.role?
			redirect_to root_path
		end
	end


end

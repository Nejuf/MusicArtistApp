class SessionsController < ApplicationController

	def new

	end

	def create
		user = User.find_by_credentials(params[:user][:email], params[:user][:password])

		if user.nil?
			flash_notice_now "Could not find user with matching email and password."
			render :new
		else
			self.current_user = user
			redirect_to user_url(user)
		end
	end

	def destroy
		logout!
		redirect_to new_session_url
	end
end

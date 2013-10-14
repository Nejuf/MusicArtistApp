module SessionsHelper

	def current_user=(user)
		@current_user = user
		session[:session_token] = @current_user.session_token
	end

	def current_user
		User.find_by(session_token: session[:session_token])
	end

	def logged_in?(user)
		!!current_user
	end

	def login!

	end

	def logout!
		current_user.reset_session_token!
		session[:session_token] = nil
	end

	def require_current_user!
		if current_user.nil?
			flash_notice_now "Must be signed in for that action."
			redirect_to new_session_url
		end
	end

	def require_current_user_matches!
		if current_user.nil?
			flash_notice_now "Must be signed in for that action."
			redirect_to new_session_url
		end

		if params[:id] && current_user.id.to_s != params[:id].to_s
			flash_notice_now "You are not authorized for that action."
			redirect_to new_session_url
			# redirect_to :back
		end
	end
end

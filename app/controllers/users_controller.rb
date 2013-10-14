class UsersController < ApplicationController

	before_filter :require_current_user!, except: [:create, :new]
	before_filter :require_current_user_matches!, only: [:show, :edit, :update]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save
			self.current_user = @user
			flash_notice_now "Successfully Signed up"
			redirect_to user_url(@user)
		else
			flash_errors_now @user
			render :new
		end
	end
	
	def edit

	end

	def update

	end

	def show
		@user = User.find(params[:id])
	end
end

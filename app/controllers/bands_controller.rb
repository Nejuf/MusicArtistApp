class BandsController < ApplicationController
	
	def index
		@bands = Band.all
	end

	def new
		@band = Band.new(params[:band])
	end

	def create
		@band = Band.new(params[:band])

		if @band.save
			flash_notice ["Band added."]
			redirect_to band_url @band
		else
			flash_errors @band
			render :new
		end
	end

	def show
		@band = Band.find(params[:id])
	end

	def edit
		@band = Band.new(params[:band])
	end

	def update
		@band = Band.new(params[:band])

		if @band.update_attributes
			flash_notice ["Band updated."]
			redirect_to band_url @band
		else
			flash_errors @band
			render :edit
		end
	end

	def destroy
		@band = Band.find(params[:id])
		@band.destroy
		redirect_to bands_url
	end
end

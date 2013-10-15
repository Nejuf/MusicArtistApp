class TracksController < ApplicationController
	
	def index
		@tracks = Album.find(params[:album_id]).tracks
	end

	def new
		@track = Track.new(params[:track])
	end

	def create
		@track = Track.new(params[:track])

		if @track.save
			flash_notice "Track added."
			redirect_to track_url(@track)
		else
			flash_errors @track.errors
			render :new
		end
	end

	def show
		@track = Track.find(params[:id])
	end

	def edit
		@track = Track.find(params[:id])
	end

	def update
		@track = Track.new(params[:track])

		if @track.update_attributes(params[:track])
			flash_notice ["Track updated."]
			redirect_to track_url(@track)
		else
			flash_errors @track.errors
			render :edit
		end
	end

	def destroy
		@track = Track.find(params[:id])
		album = @track.album_id
		@track.destroy
		redirect_to album_url(album)
	end
	
end

class AlbumsController < ApplicationController

	def index
		@albums = Band.find(params[:band_id]).albums
	end

	def new
		@album = Album.new(params[:album])
	end

	def create
		@album = Album.new(params[:album])

		if @album.save
			flash_notice ["Album added."]
			redirect_to album_url @album
		else
			flash_errors_now @album.errors
			render :new
		end
	end

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.create(params[:album])

		if @album.update_attributes params[:album]
			flash_notice ["Album updated"]
			redirect_to album_url @album
		else
			flash_errors_now @album.errors
			render :edit
		end
	end

	def destroy
		@album = Album.find(params[:id])
		band = @album.band_id
		@album.destroy
		redirect_to band_url(band)
	end

end

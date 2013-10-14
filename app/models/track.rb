class Track < ActiveRecord::Base
	attr_accessible :name, :lyrics, :type, :album_id
	validates :name, presence: true
	validates :type, presence: true, inclusion: ["regular", "bonus"]
	validates :album_id, presence: true
	
	belongs_to :album
	belongs_to :band, through: :album
end

class Track < ActiveRecord::Base
	self.inheritance_column = nil #enables us to use "type" as a column name

	attr_accessible :name, :lyrics, :type, :album_id, :track_length
	validates :name, presence: true
	validates :type, presence: true, inclusion: {in: ["regular", "bonus"], message: "is not a valid type"}
	validates :album_id, presence: true
	
	belongs_to :album
	def band
		album.band
	end
end

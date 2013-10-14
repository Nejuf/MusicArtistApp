class Track < ActiveRecord::Base
	attr_accessible :name, :lyrics, :type
	validates :name, presence: true
	validates :type, presence: true, inclusion: ["regular", "bonus"]

	belongs_to :album
	belongs_to :band, through: :album
end

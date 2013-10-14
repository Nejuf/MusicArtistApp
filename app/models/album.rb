class Album < ActiveRecord::Base
	attr_accessible :name, :type
	validates :name, presence: true
	validates :type, presence: true, inclusion: ["live", "studio"]

	has_many :tracks, dependent: :destroy
	belongs_to :band
end

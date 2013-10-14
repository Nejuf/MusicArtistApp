class Album < ActiveRecord::Base
	self.inheritance_column = nil #makes it so our "type" column name does not interfere with ActiveRecord

	attr_accessible :name, :type, :band_id
	validates :name, presence: true
	validates :type, presence: true, inclusion: { in: ["live", "studio"], message: "is not a valid type" }
	validates :band_id, presence: true

	has_many :tracks, dependent: :destroy
	belongs_to :band
end

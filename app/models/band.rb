class Band < ActiveRecord::Base
	attr_accessible :name
	validations :name, presence: true

	has_many :albums, dependent: :destroy
	has_many :tracks, through: :albums
end

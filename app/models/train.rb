class Train < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	
	has_many :train_stations 
	has_many :stations, through: :train_stations 
	has_many :train_times
end

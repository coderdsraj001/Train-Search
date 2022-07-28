class Station < ApplicationRecord
	validates :name, presence: true, uniqueness: true

	has_many :train_stations  
	has_many :trains, through: :train_stations
	has_many :train_times

	def self.search(search)
		if search
			where(['name LIKE ?', "%#{search}%"])
		else
			all.limit(2)
		end
	end
end

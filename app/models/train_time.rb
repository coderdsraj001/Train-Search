class TrainTime < ApplicationRecord
	validates :arrival, presence: true
	validates	:departure, presence: true

	belongs_to :station
	belongs_to :train
end
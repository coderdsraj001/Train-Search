class TrainTimePresenter
	attr_reader :train_time

	def initialize(station)
		@station = station
	end

	def train_time3
		t2 = []
		@station.train_times.each do |train_time3|
			t2 << train_time3
		end
		t2
	end

end


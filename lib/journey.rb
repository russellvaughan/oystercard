class Journey

attr_reader :journey_history, :entry_station

	def initialize
		@journey_history = {}
	end

	def in_journey?
		!!@entry_station
	end

	def start_journey(station)
			@entry_station = station
    journey_history["entry_station"] = @entry_station 
	end

end
class Journey

attr_reader :journey_history, :entry_station, :exit_station, :log

	PENALTY_FARE = 6

	def initialize
		@journey_history = {}
		@log = [] 
	end

	def in_journey?
	!!@entry_station
	end

	def start_journey(station)
	@entry_station = station
    journey_history["entry_station"] = @entry_station 
	end

	def end_journey(station)
	complete_journey
	journey_history["exit_station"] = station 
	log_journey
	end

	def fare
	in_journey? ? PENALTY_FARE : OysterCard::MINIMUM_AMOUNT 
	end
	


	private 

	def log_journey
	@log<<@journey_history 
	clear_history
	end

	def clear_history
	@journey_history = {}
	end

	def complete_journey
	@entry_station = nil
	end

	


end
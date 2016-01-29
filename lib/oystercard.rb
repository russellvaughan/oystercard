#
class OysterCard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1

 MINIMUM_CHARGE = 1

 attr_reader :balance, :entry_station,  :previous_journeys
 attr_accessor :in_journey

 def initialize
   @balance = 0
   @in_journey = false
   @previous_journeys = {}
 end

 def top_up(amount)
 	raise "error balance greater than maximum balance" if balance + amount > MAXIMUM_BALANCE
 	@balance += amount
 end

 def touch_in(station)
 	raise 'Balance too low.' if balance < MINIMUM_BALANCE
 	@previous_journeys.merge!("entry_station" => station)
 	@in_journey = true
 end

 def touch_out(exit_station)
 	@previous_journeys.merge!("exit_station" => exit_station)
 	deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @in_journey = false
 end

 def in_journey?
   !!entry_station
 end

 private

 def deduct(amount)
 	@balance -= amount
 end

end


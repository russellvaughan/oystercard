class OysterCard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1

 MINIMUM_CHARGE = 1

 attr_reader :balance
 attr_accessor :in_journey

 def initialize()
   @balance = 0 
   @in_journey = false
 end

 def top_up(amount)
 	raise "error balance greater than #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
 	@balance += amount
 end

 def touch_in
 	raise 'Balance too low.' if balance < MINIMUM_BALANCE
 	@in_journey = true
 end

 def touch_out
 	deduct(MINIMUM_CHARGE)
    @in_journey = false
 end

 private 

 def deduct(amount)
 	@balance -= amount
 end

end
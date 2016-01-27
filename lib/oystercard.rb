class OysterCard

 MAXIMUM_BALANCE = 90
 MINIMUM_BALANCE = 1
 attr_reader :balance
 attr_accessor :status

 def initialize()
   @balance = 0 
   @status = false
 end

 def top_up(amount)
 	raise "error balance greater than #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
 	@balance += amount
 end

 def deduct(amount)
 	@balance -= amount
 end

 def touch_in
 	raise 'Balance too low.' if balance < MINIMUM_BALANCE
 	@status = true
 end

 def touch_out
    @status = false
 end

 def in_journey?
   @status
 end

end
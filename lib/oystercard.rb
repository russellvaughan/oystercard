class OysterCard

 MAXIMUM_BALANCE = 90

 attr_reader :balance	

 def initialize
   @balance = 0
 end

 def top_up(amount)
 	raise "error balance greater than #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
 	@balance += amount
 end






end


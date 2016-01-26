class OysterCard

 attr_reader :balance	

 def initialize
   @balance = 0
 end

 def add_balance(amount)
 	@balance += amount
 end

end
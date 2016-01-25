

class OysterCard

 attr_reader :balance

 MAXIMUM_AMOUNT = 90

	def initialize
		@balance = 0
	end

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAXIMUM_AMOUNT}" if (balance + amount) > MAXIMUM_AMOUNT
		@balance += amount	
	end
	


end
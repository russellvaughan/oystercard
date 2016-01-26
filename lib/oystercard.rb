class Card 

MAXIMUM_LIMIT = 90

	attr_reader :balance, :limit

	def initialize(limit=MAXIMUM_LIMIT)
		@balance = 0
		@limit = limit
	end

	def top_up(amount)
		new_balance = @balance + amount
		message = "You cannot exceed the £#{@limit} limit!"
		raise (message) if new_balance > @limit
		@balance += amount
	end

end


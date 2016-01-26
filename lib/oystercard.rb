class Card

MAXIMUM_LIMIT = 90
MINIMUM_BALANCE = 1

	attr_reader :balance, :limit

	def initialize(limit=MAXIMUM_LIMIT)
		@balance = 0
		@limit = limit
    @touch = false

	end

	def top_up(amount)
		new_balance = @balance + amount
		message = "You cannot exceed the maximum limit!"
		raise (message) if new_balance > @limit
		@balance += amount
	end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    message = "cannot touch in as minimum balance has not been met"
    raise(message) if @balance < MINIMUM_BALANCE
    @touch = true
  end

  def touch_out
    @touch = false
  end

  def in_journey?
    @touch
  end

end


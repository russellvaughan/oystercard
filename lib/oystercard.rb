

class OysterCard

 attr_reader :balance

 MAXIMUM_AMOUNT = 90

	def initialize
		@balance = 0
    @in_journey = false
	end

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAXIMUM_AMOUNT}" if max?(amount)
		@balance += amount
	end

	def deduct(amount)
		@balance -= amount
	end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def max?(amount)
    @balance + amount > MAXIMUM_AMOUNT
  end


end


class OysterCard

 attr_reader :balance

 MAXIMUM_AMOUNT = 90
 MINIMUM_AMOUNT = 1

	def initialize
		@balance = 0
    @in_journey = false
	end

	def top_up(amount)
    fail "Does not accept negative amounts" if amount < 0
    fail "You have reached £#{MAXIMUM_AMOUNT}" if max?(amount)
		@balance += amount
	end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient Funds Available" if low_funds?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_AMOUNT)
  end

  private

  def max?(amount)
    @balance + amount > MAXIMUM_AMOUNT
  end

  def low_funds?
    @balance < MINIMUM_AMOUNT
  end

  def deduct(amount)
    @balance -= amount
  end


end
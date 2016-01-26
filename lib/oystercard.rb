class Oystercard

attr_reader :balance

MAX_LIMIT = 90



  def initialize
  @balance = 0
  @in_journey = false
  end

  def top_up(amount)
  fail "Maximum limit of #{Oystercard::MAX_LIMIT} reached" if balance_exceeded(amount)
  @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_journey = true

  end


  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

private

	def balance_exceeded(amount)
  (@balance + amount) > MAX_LIMIT
  end



end

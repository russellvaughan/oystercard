class Oystercard

attr_reader :balance, :entry_location

MAX_LIMIT = 90
SINGLE_JOURNEY = 1


  def initialize
  @balance = 0
  end

  def top_up(amount)
  fail "Maximum limit of #{MAX_LIMIT} reached" if balance_exceeded(amount)
  @balance += amount
  end

  def touch_in(location)
  fail "insufficient funds" if balance < SINGLE_JOURNEY
  @entry_location = location

  end


  def touch_out
  deduct(SINGLE_JOURNEY)
  clear_entry_location
  end

  def in_journey?
    !!entry_location

  end

  private

	def balance_exceeded(amount)
  (@balance + amount) > MAX_LIMIT
  end

  def deduct(amount)
    @balance -= amount
  end

  def clear_entry_location
    @entry_location = nil
  end


end

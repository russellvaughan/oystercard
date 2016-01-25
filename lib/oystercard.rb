class Oystercard

attr_reader :balance
MAX_LIMIT = 90

  def initialize
  @balance = 0
  end

  def top_up(amount)	
  fail "Maximum limit of #{Oystercard::MAX_LIMIT} reached" if balance_exceeded(amount)
  @balance += amount
  end

private

	def balance_exceeded(amount)

	(@balance + amount) > MAX_LIMIT

	end	

end



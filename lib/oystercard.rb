class Oystercard

attr_reader :balance
#DEFAULT_VALUE = 0

  def initialize
  @balance = 0
  end

  def top_up(amount)
    @balance += amount

  end


end


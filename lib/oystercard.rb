

class Oystercard

attr_reader :balance



	def initialize
		@balance = 0
	end

	def topup(amount)
		self.balance = amount	
	end
	private
	attr_writer :balance


end
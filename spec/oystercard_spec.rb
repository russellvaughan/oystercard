require 'oystercard'

  describe Oystercard do 

	subject(:card) { described_class.new }	

		it 'displays a balance of zero when card is new' do 
		expect(card.balance).to eq 0

		end


	describe '#topup' do #when you describe a method it's lowercase and it's string.

		it 'allows user to top up' do
		card.topup(5)
		expect(card.balance).to eq 5 

		end

	end
	
  end





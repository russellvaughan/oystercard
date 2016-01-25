require 'oystercard'

describe Oystercard do 
	it "it has a default balance of 0" do 
	card = Oystercard.new
	card.balance 
	expect(card.balance).to eq 0
end 
end

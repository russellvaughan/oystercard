require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it "it has a default balance of 0" do
	 oystercard.balance
	 expect(oystercard.balance).to eq 0
  end

  it 'allows a user to top up the balance' do
    expect{subject.top_up 10}.to change{ subject.balance }.by 10

  end

  it "it has a maximum limit of £90" do
    oystercard.top_up(90)
    message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
    expect{oystercard.top_up 1}.to raise_error message
  end

  it 'Deducts fare from the card' do
    oystercard.top_up(50)
    expect{oystercard.deduct 30}.to change{ oystercard.balance }.by -30
  end

  it 'Allows users to touch in and out' do
    oystercard.top_up(90)
    oystercard.touch_in
    oystercard.in_journey?
    oystercard.touch_out
    expect(oystercard.in_journey?).to be false
  end

  it "Tests that you need a minimum amount for a single jouney" do
    message = "insufficient funds"
    expect{oystercard.touch_in}.to raise_error message
  end

end

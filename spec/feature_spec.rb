require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it "It has a default balance of 0" do
	 oystercard.balance
	 expect(oystercard.balance).to eq 0
  end

  it 'Allows a user to top up the balance' do
    expect{subject.top_up 10}.to change{ subject.balance }.by 10

  end

  it "It has a maximum limit of £90" do
    oystercard.top_up(90)
    message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
    expect{oystercard.top_up 1}.to raise_error message
  end


  it 'Allows users to touch in and out' do
    location = Location.new
    oystercard.top_up(90)
    oystercard.touch_in(location)
    oystercard.in_journey?
    oystercard.touch_out
    expect(oystercard.in_journey?).to be false
  end

  it "Tests that you need a minimum amount for a single jouney" do
    location = Location.new
    message = "insufficient funds"
    expect{oystercard.touch_in(location)}.to raise_error message
  end

  it "It deducts money when you touch out" do
    location = Location.new
    oystercard.top_up(20)
    oystercard.touch_in(location)
    expect{oystercard.touch_out}.to change {oystercard.balance}.by(-Oystercard::SINGLE_JOURNEY)
  end

  it 'Knows where the user has travelled from' do
    location = Location.new
    oystercard.top_up(20)
    oystercard.touch_in(location)
    expect(oystercard.entry_location).to eq (location)
  end

  it 'Resets entry location to nil when touched out' do
    location = Location.new
    oystercard.top_up(20)
    oystercard.touch_in(location)
    oystercard.touch_out
    expect(oystercard.entry_location).to eq nil
  end


end

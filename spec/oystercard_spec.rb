require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  	it "instaniates an oystercard class" do
  		expect(subject).to be_a Oystercard
  	end

   	it "responds to the method balance" do
   		expect(subject).to respond_to (:balance)
   	end

    it 'it should respond to top_up ' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end


describe '#top_up' do

    it 'should increase the balance by 10 when passed 10' do
      expect{subject.top_up 10}.to change{ subject.balance}.by 10
    end
    end

  describe 'When maximum limit exceed' do
    it 'should raise an error ' do
    oystercard.top_up(Oystercard::MAX_LIMIT)
    message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
    expect{oystercard.top_up 1}.to raise_error message
    end
    end

describe '#deduct' do
  it 'Deducts balance by amount deducted' do
    oystercard.top_up(50)
    expect{oystercard.deduct 30}.to change{ oystercard.balance }.by -30
  end
end
  

context 'when card is in use' do
  before(:each)do
  oystercard.top_up(Oystercard::MAX_LIMIT)
end

  describe '#touch_in' do
    it 'allows a user to touch in' do
    expect(oystercard).to respond_to(:touch_in)
    end
    end

  describe '#in_journey' do
    it 'has a default value of false' do
    expect(oystercard.in_journey?).to be false
    end

    it 'shows whether a user has touched in or out' do
    oystercard.touch_in
    expect(oystercard.in_journey?).to be true
    end
  end

    it "Tests that you need a minimum amount for a single jouney" do
    allow(oystercard).to receive(:balance) {0}
    message = "insufficient funds"
    expect{oystercard.touch_in}.to raise_error message
    end

  describe '#touch_out' do
    it 'allows a user to touch_out' do
    oystercard.touch_in
    oystercard.touch_out
    expect(oystercard.in_journey?).to be false
    end
  end




end

end

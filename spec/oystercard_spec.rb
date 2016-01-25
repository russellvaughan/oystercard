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

  context 'When maximum limit exceed' do
    it 'should raise an error ' do
    oystercard.top_up(Oystercard::MAX_LIMIT)
    message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
    expect{oystercard.top_up 1}.to raise_error message
    end 
    end
end

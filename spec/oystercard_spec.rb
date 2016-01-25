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
end

require 'oystercard'
require 'location'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:location) {double(:location)}


  describe '#top_up' do

    it 'Should increase the balance by 10 when passed 10' do
      expect{subject.top_up 10}.to change{ subject.balance}.by 10
    end
  end

    it 'Raises an error when limit is exceeded ' do
      oystercard.top_up(Oystercard::MAX_LIMIT)
      message = "Maximum limit of #{Oystercard::MAX_LIMIT} reached"
      expect{oystercard.top_up 1}.to raise_error message
    end


  context 'Methods testing when card is in use' do

    before(:each)do
      oystercard.top_up(Oystercard::MAX_LIMIT)
    end

    describe '#touch_in' do

      it 'Allows a user to touch in' do
        expect(oystercard).to respond_to(:touch_in) 
        end
      end

    describe '#in_journey' do

      it 'Has a default value of false' do
      expect(oystercard.in_journey?).to be false
    end

      it 'Shows whether a user has touched in or out' do
        oystercard.touch_in(location)
        expect(oystercard.in_journey?).to be true
      end

      it "Tests that you need a minimum amount for a single jouney" do
        allow(oystercard).to receive(:balance) {0}
        message = "insufficient funds"
        expect{oystercard.touch_in(location)}.to raise_error message
      end
    end

  describe '#touch_out' do

    it 'Allows a user to touch_out' do
      oystercard.touch_in(location)
      oystercard.touch_out(location)
      expect(oystercard.in_journey?).to be false
    end

    it 'Resets entry location to nil when touched out' do
      oystercard.touch_in(location)
      oystercard.touch_out(location)
      expect(oystercard.entry_location).to eq nil
    end
  
  describe '#history' do
    it 'Records the entry and exit locations in a hash' do 
      location1=Location.new
      location3 =Location.new
      oystercard.touch_in(location1)
      oystercard.touch_out(location3)
      expect(oystercard.history).to eq ({"journey"=>[location1, location3]})
      end
    end
  end

    it 'Deducts single journey from balance' do
      expect{oystercard.touch_out(location)}.to change{oystercard.balance}.by(-Oystercard::SINGLE_JOURNEY)
    end
  end

  describe '#entry_location' do
    it 'Records entry location' do
      oystercard.top_up(20)
      oystercard.touch_in(location)
      expect(oystercard.entry_location).to eq (location)
    end
  end
  describe '#exit_location' do
    it 'Records entry location' do
      oystercard.top_up(20)
      oystercard.touch_out(location)
      expect(oystercard.journey).to eq [location]
    end
  end

end

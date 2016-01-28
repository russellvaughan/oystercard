require 'journey'

describe Journey do
	subject(:journey) { described_class.new }
	let(:card)  { double(:card, :touch_in => true) }
	let(:entry_station)  { double(:entry_station) }


describe 'journey_history' do

	

      it 'displays an empty journey history when new' do
      expect(journey.journey_history).to eq ({}) 
      #other way woud be 
      #expect(card.journey_history.empty?).to eq true 
      end
    end

    context '#in_journey?' do
    	it 'new card isn\'t in journey' do
    		expect(journey.in_journey?).to eq false
    	end

    	it 'it changes the status of in_journey' do
            journey.start_journey(entry_station)
            expect(journey.in_journey?).to eq true
        end
    end


    context 'start journey' do

          it 'remembers entry station' do
          	journey.start_journey(entry_station)
          	expect(journey.journey_history["entry_station"]).to eq entry_station
          end

    end
end

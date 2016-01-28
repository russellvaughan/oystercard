require 'journey'
require 'oystercard'
describe Journey do
	subject(:journey) { described_class.new }
	let(:card)  { double(:card, :touch_in => true, :touch_out => true) }
	let(:entry_station)  { double(:entry_station) }
  let(:exit_station)  { double(:exit_station) }


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

  context 'end journey' do

          it 'has touched out at station' do
        card.touch_out(exit_station)
        expect(journey.in_journey?).to eq false
      end

      #    it 'remembers exit_station after checking out' do
      #   journey.end_journey(exit_station)
      #   expect(journey.journey_history["exit_station"]).to eq exit_station
      # end   


    end

  context "#journey_history" do
      # it 'records the journey history of a user' do
      # journey.start_journey(entry_station)
      # journey.end_journey(exit_station)
      # expect(journey.journey_history).to include  ({"entry_station" => entry_station, "exit_station" => exit_station})
      # end
   
      it 'logs multiple journeys' do
      journey.start_journey(entry_station)
      journey.end_journey(exit_station) 
      journey.start_journey(entry_station)
      journey.end_journey(exit_station) 
      expect(journey.log).to eq ([{"entry_station" => entry_station, "exit_station" => exit_station}, {"entry_station" => entry_station, "exit_station" => exit_station}])
      end
   end 


   describe '#fare' do
    it 'calulates the correct fare' do
    journey.start_journey(entry_station)
    journey.end_journey(exit_station) 
    expect(journey.fare).to eq OysterCard::MINIMUM_AMOUNT 
    end
    
    it 'calulates the correct fare if complete journey' do
    journey.start_journey(entry_station)
    journey.end_journey(exit_station) 
    expect(journey.fare).to eq OysterCard::MINIMUM_AMOUNT 
    end
   
    it 'calculate the correct fare if incomplete journey' do
    journey.start_journey(entry_station)
    journey.start_journey(entry_station)
    expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end







end

  require 'oystercard'

  describe OysterCard do

  	subject(:card) { described_class.new }
  	let(:entry_station)  { double(:station) }
    let(:exit_station)   { double(:station) }

    it 'displays a balance of zero when card is new' do
      expect(card.balance).to eq 0

    end

  	describe '#top_up' do #when you describe a method it's lowercase and it's string.

      it { is_expected.to respond_to(:top_up).with(1).argument }

      it 'allows user to top up' do
        card.top_up(5)
        expect(card.balance).to eq 5

      end

      it 'does not allow negative amounts' do
        expect { card.top_up(-2) }.to raise_error "Does not accept negative amounts"

      end

      it 'has a £90 limit on top ups' do
        balance_limit = OysterCard::MAXIMUM_AMOUNT
        card.top_up(balance_limit)
        expect { card.top_up(1) }.to raise_error "You have reached £90"
      end

    end

    describe 'touching in and out' do

      context 'have money on card' do

        before do
          card.top_up(1)
        end

        context '#in_journey?' do
          it 'new card isn\'t in journey' do
            expect(card.in_journey?).to eq false
          end
        end


        context '#touch_in' do
          it 'has touched in at entry_station' do
            card.touch_in(entry_station)
            expect(card.in_journey?).to eq true
          end
        

        it 'remembers entry station' do
         card.touch_in(entry_station)
         expect(card.entry_station).to eq entry_station
       end
     end

     context '#touch_out' do
      it 'has touched out at station' do
        card.touch_out(exit_station)
        expect(card.in_journey?).to eq false
      end

      it 'charges for the journey' do
        card.touch_in(entry_station)
        expect {card.touch_out(exit_station)}.to change{card.balance}.by(-OysterCard::MINIMUM_AMOUNT)
      end

      it 'remembers exit_station after checking out' do
        card.touch_out(exit_station)
        expect(card.exit_station).to eq exit_station
      end   
    end
   end 

    context "no money on card" do
      it 'does not allow to touch in at entry_station' do
        expect {card.touch_in(entry_station)}.to raise_error "Insufficient Funds Available"
      end
    end

  end



  end












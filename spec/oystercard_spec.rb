require 'oystercard'

describe Card  do 

		it 'has a balance of zero' do
		expect(subject.balance).to eq(0)
		end 

		it {is_expected.to respond_to(:balance)}

		it {is_expected.to respond_to(:top_up).with(1).argument }
end
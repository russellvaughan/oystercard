require 'oystercard'

describe Card  do 

		it 'has a balance of zero' do
		expect(subject.balance).to eq(0)
		end 

		it {is_expected.to respond_to(:top_up).with(1).argument }

		it "tops up the balance" do
			expect{ subject.top_up(1) }.to change{ subject.balance }.by(1)
		end

end
require 'oystercard'

describe Card  do 

	   limit = Card::DEFAULT_LIMIT

		it 'has a balance of zero' do
		expect(subject.balance).to eq(0)
		end 

		it {is_expected.to respond_to(:top_up).with(1).argument }

		it 'tops up the balance' do
		expect{ subject.top_up(1) }.to change{ subject.balance }.by(1)
		end

		it {is_expected.to respond_to(:limit)} 

		it "has a limit of #{limit}" do
		expect(subject.limit).to eq(limit)
		end

		it 'has a default limit' do
		expect(subject.limit).to eq limit # Card::DEFAULT_LIMIT
		end

		it "cannot exceed #{limit}" do
		message = "You cannot exceed the #{limit} limit!"
		subject.top_up(limit)  # the value needs to be less than the limit less what is topped up in test (so if default value = 90, and you top up 1 or more, you need value of 89 or less)
		expect{subject.top_up(1)}.to raise_error(message)
		end

end
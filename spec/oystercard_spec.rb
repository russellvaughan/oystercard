require 'oystercard'

describe OysterCard do
  it 'has a balance of zero' do
  	expect(subject.balance).to eq(0)
  end

describe '#top_up' do
  it 'adds amount to balance' do
  expect{subject.top_up(1)}.to change{subject.balance}.by 1
 end 
end

it 'raises an error when balance more than 90' do
    maximum_balance = OysterCard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
	expect{ subject.top_up(1) }.to raise_error "error balance greater than #{maximum_balance}"
end

 describe '#deduct' do
  it 'deducts amount from balance' do
    subject.top_up(20)
  expect{subject.deduct(1)}.to change{subject.balance}.by -1
  end
 end
 describe '#touch_in' do
  it 'it touches in' do
  subject.touch_in
  expect(subject.status).to eq(true)
end
end
 describe '#touch_out' do
 it 'touches out' do
  subject.touch_in
  subject.touch_out
  expect(subject.status).to eq(false)
end
end

 describe '#in_journey?' do
  it 'returns true when in journey' do
    subject.touch_in
    expect(subject).to be_in_journey
  end
  it 'returns false initially' do
    expect(subject).not_to be_in_journey
  end
end














end

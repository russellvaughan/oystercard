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





end

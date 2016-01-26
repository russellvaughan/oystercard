require 'oystercard'

describe OysterCard do
  it 'has a balance of zero' do
  	expect(subject.balance).to eq(0)
  end

describe '#add_balance' do
  it 'adds amount to balance' do
  expect{subject.add_balance(1)}.to change{subject.balance}.by 1
 end 
end
end

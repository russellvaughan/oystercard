require 'oystercard'

describe OysterCard do
  it 'has a balance of zero' do
  	expect(subject.balance).to eq(0)
  end

describe '#top_up' do
  it 'adds top_up amount to balance' do
  expect{subject.top_up(1)}.to change{subject.balance}.by 1
 end 
end
end

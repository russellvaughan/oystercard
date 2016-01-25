require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it "it has a default balance of 0" do
	oystercard.balance
	expect(oystercard.balance).to eq 0
end

  it 'allows a user to top up the balance' do
    expect{subject.top_up 10}.to change{ subject.balance}.by 10

  end


end

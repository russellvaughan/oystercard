require 'oystercard'

RSpec.describe Card do


subject(:oystercard) { described_class.new }
station =


	it 'creates a new card' do
		expect(described_class.new).to be_a(Card)
	end

	context 'balance' do

		it 'has a balance of zero' do
		expect(subject.balance).to eq(0)
		end
	end

	context 'top ups' do

		it {is_expected.to respond_to(:top_up).with(1).argument }

		it 'tops up the balance' do
		expect{ subject.top_up(1) }.to change{ subject.balance }.by(1)
		end

	end

	context 'limit' do

		it {is_expected.to respond_to(:limit)}

		it "has a limit of described_class::MAXIMUM_LIMIT" do
		expect(subject.limit).to eq(described_class::MAXIMUM_LIMIT)
		end

		it 'has a default limit' do
		expect(subject.limit).to eq described_class::MAXIMUM_LIMIT
		end

		it "cannot exceed a maximum limit" do
		message = "You cannot exceed the maximum limit!"
		subject.top_up(described_class::MAXIMUM_LIMIT)
		expect{subject.top_up(1)}.to raise_error(message)
		end
	end
=begin
  context 'deducts' do

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts from balance' do
    expect{subject.deduct(1)}.to change{ subject.balance }.by(-1)
    end

  end
=end
  context 'card in use' do

    it { is_expected.to respond_to(:touch_in).with(1).argument}
    it { is_expected.to respond_to(:touch_out)}
    it { is_expected.to respond_to(:in_journey?)}

    it 'it is not in a journey ?' do
    expect(subject.in_journey?).to eq false
    end

  end

  context 'topped up' do

    it 'needs to be topped up' do
    subject.top_up(1)
    end

    it 'can touch_in' do
    subject.top_up(1)
    subject.touch_in
    expect(subject).to be_in_journey
    end

    it 'can touch_out' do
    subject.top_up(1)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
    end

  end

  context 'balance dependencies' do

    it 'cannot touch_in unless minimum balance met' do
      message = "cannot touch in as minimum balance has not been met"
      expect{subject.touch_in}.to raise_error(message)
    end

    it 'deducts balance on check out' do
    subject.top_up(1)
    subject.touch_in
    expect{subject.touch_out}.to change{ subject.balance }.by(-1)
    end

  end

end
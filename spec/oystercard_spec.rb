require 'oystercard'

describe Oystercard do
 
	it "instaniates an oystercard class" do
		expect(subject).to be_a Oystercard
	end

 	it "responds to the method balance" do 
 		expect(subject).to respond_to (:balance)
 	end

end

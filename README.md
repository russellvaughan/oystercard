#Project Name: Oystercard Challenge

#Week 2 of Makers Academy
--------------------------

The key learning objectives for this challenge were focused around effective Code Design, Ruby, RSpec and Object-Oriented Programming.

Authors:
--------

Russell Vaughan, Barry Grubb, David Parry, Fareed Patel, Matthew Drake, Reiss Johnson

Features of program
--------------------

This is a replica of the London Underground Oystercard system. It allows you to create a basic oyster card, add a balance, enable top up functionality, enforce a maxium balance and deduct the money. It also allows you to add touch in / out support. Checking a minimum balance on touch in and charging for the journey. It also, allows you to record the journey history.

Installation and example use
----------------------------

```
2.2.3 :001 > require './lib/oystercard.rb'
 => true 
2.2.3 :002 > oystercard = OysterCard.new
 => #<OysterCard:0x007fb66c827088 @balance=0, @in_journey=false> 
2.2.3 :003 > london_bridge = Station.new 'london_bridge', 1
 => #<struct Station name="london_bridge", zone=1> 
2.2.3 :004 > bank  = Station.new 'bank', 1
 => #<struct Station name="bank", zone=1> 
2.2.3 :005 > oystercard.top_up(10)
 => 10 
2.2.3 :006 > oystercard.touch_in(london_bridge)
 => #<Journey:0x007fb66c07eb88 @previous_journeys={"entry_station"=>#<struct Station name="london_bridge", zone=1>}, @entry_station=#<struct Station name="london_bridge", zone=1>, @complete=false> 
2.2.3 :007 > oystercard.touch_out(bank)
 => 9 
2.2.3 :008 > oystercard.balance
 => 9 
2.2.3 :009 > oystercard.previous_journeys
 => {"entry_station"=>#<struct Station name="london_bridge", zone=1>, "exit_station"=>#<struct Station name="bank", zone=1>} 

```

 Key Learnings:
 --------------
 Creating Structs
 Creating Gemfiles
 Extracting Classes
 Dependency Injection
 T.D.D.

---
title:  "Why Does Ruby Add Numbers Wrong?"
date:   "2017-03-08"
categories: [code]
tags: [ruby]
---

Why Does Ruby Add Numbers Wrong?
<!--more-->

So, I was minding my own business, adding numbers up for fun in irb, when this happened:

    
      irb> 1.0 + 1.0
      => 2.0
      irb> 1.4 + 1.2
      => 2.5999999999999996
    
  
This was not correct. Computers work off of logic and run off of 0 and 1, so the return should be 2.6 not 2.5999999999999996. Where did all the 9s come from? How come the computer did not add correctly?

So What's Happening?

Adding 1.0 to 1.0 produces the correct result, 2.0. Adding 1.4 to 1.2 should produce 2.6, but instead produces 2.5999999999999996. This is not correct, the amount of nines is infuriating. The reason for the error comes from decimal points being float objects in Ruby. Fixed numbers (Fixnum) can do math correctly in Ruby and float numbers do not reliably produce the correct result.

In lay terms, a float is the way to represent a number that has a decimal point and fixnums are numbers without decimal points.

    
      irb> 1.class
      => Fixnum
      irb> 1.0.class
      => Float
    
  
(the '.class' gives a user the class of an object and it is terribly useful when debugging)

All of these are a representation of ONE in different formats. If the number has a decimal, it's a Float and not a Fixnum (and does calculations correctly). The Ruby docs say this about Floats

"Float objects represent inexact real numbers using the native architecture's double-precision floating point representation. Floating point has a different arithmetic and is an inexact number."

Why would we need "an inexact number"?

The answer is no, no we don't. It's like text aligned a bit off-center.

So most Ruby devs feel this at some point, they are minding their own business a coding an application which needs a decimal point. Normally this decimal point is for money. Money is important and POW all hell breaks loose when the price of a list of times totals to an amount with five decimal places.

But, Why?

Floats are inaccurate because of decisions made by engineers long ago. Remember the 1s and 0s used in by computers? A decision had to be made on how to store numbers and... well... hindsight is 20 20. The way floats are stored in computer memory (bits) causes inappropriate rounding. Stackoverflow has a few answers to this question, I like the one with an example. If you need a hint for researching, look up single and double precision. And if you want to (and you should) read about the history of number storage in computers, I suggest reading, breathing and then reading again. This is a good use of the word 'esoteric'. In summary, floats lack accuracy because they are stores in the computer's memory in a way which causes issues with math functions.

Then again, you are reading this and wondering when the solution comes about

So, What's the solution

If your first thought is to round the total, read further. I only know because I tried it, banged my head against the wall with getting a recursion method to work.

In Ruby, we have a type of object called BigDecimal. Yes, BigDecimal is not a joke. BigDecimal is the class to use to calculate with decimals (and not just display). It has arbitrary-precision, not to be confused with single or double precision, arbitrary-precision is better. I'm making fun of it a bit while I must acknowledge that how the computer stores data is important. It's important to know about but maybe not invest too much energy into unless you are interested in it or run into a problem which might come from it. It's similar to my idea of learning to make tortillas, yes it would be useful but no, the time

      
        irb> total = BigDecimal.new('1.0') + BigDecimal.new('1.0')
        => #
        irb> total.to_f
        => 2.0
      
    
In the example above, both floats are put into a BigDecimal object and then have to be taken out of it. It feels a bit odd, put the numbers into an object to take it out to get the results of the calculation.

There's a gem for working with money called Money

    
      irb> require 'money'
      => true
      irb> total = Money.new(1.00, "USD") + Money.new(1.00, "USD")
      => #
      irb> total.fractional
      => 2
      irb> total.currency
      => #
    
  
I ran `gem install Money` before going into irb.

The Money gem handles currencies. Notice how the object has an amount ("1.00") and a currency ("USD"). Total is a Money object with an amount (the total) and a whole ton of extra information about the currency stored in it, like the symbol. It seems like a bit excessive until looking at the docs to realize all the baked in functionality. If you had to convert into money from an unfamiliar country, the currency information would be useful.

Think you can round?

    
      irb> total = 1.0 + 1.0
      => 2.0
      irb> total = 1.4 + 1.2
      => 2.5999999999999996
      irb> total.round
      => 3
      irb> total.round(2)
      => 2.6
      irb(main):005:0> 
    
  
It worked this time but feels unreliable for working other times. It's not reliable and you will either find the problem yourself or find out the hard way.

One last option is to use this code which is string conversion

      
        irb> total = 1.4 + 1.2
        => 2.5999999999999996
        irb> '%.02f' % total
        => "2.60"
      
    
This might be a lesson in "Don't use everything you find on Stackoverflow". It works, but is not idea. I'm not the expert on this but used it in a code challenge and this feedback "Uses String conversions to compensate for floating point math issues" in the negative column. Not everything that works is right.

To deal with floats when doing math in Ruby, the options are BigDecimal, the Money gem, or string conversion. Rounding will not consistently work and people tend to want their numbers to be accurate. The Money gem is the tool if you are doing math to money (it was nicely named) and BigDecimal is good for general use. The string conversion method works, but feels kinda hacky so I can't recommend it.

Thing to remember: how the computer stores decimal values causes floats (numbers with decimal places) to be inconsistent when doing math, use BigDecimal or the Money gem to be accurate and don't sweat it, everyone has hit this at one time or another.


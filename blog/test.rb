

numbers = [3, 4, 5]

#Bloc

p numbers.each {|num| num + 1}

p numbers.each do |num|
	num + 1
end

#Proc
add_one = Proc.new {|num| num + 1}

p add_one.map!(numbers)

#Lambda
puts "This is with lambda"
add_one_lambda = lambda {|num| num + 1}
p numbers.add_one_lambda


























class  Car1
	def initialize(body, engine, wheels, steering)
		@body = body
		@engine = engine
		@wheels= wheels
		@steering = steering
	end

	def describe_car
		puts "It's a #{@body} with a #{@engine} engine, #{@wheels} wheels, and #{@steer} steering."
	end
	
	
end

test_car_1 = Car1.new('sedan', 'V8', '235/30R20', 'power')

puts test_car_1.describe_car





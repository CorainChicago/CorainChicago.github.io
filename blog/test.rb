class  Car2
	def initialize (color, make, model, licence_plate)
		@color = color
		@make = make
		@model = model
		@licence_plate = licence_plate
	end 

	def describe_car
		puts "It's a #{@color} with a #{@make} engine, #{@model} wheels, and the licence plate number is #{@licence_plate}."
	end
end
test_car_2 = Car2.new('red', 'Toyota', 'Camry', 'WJE 910')
puts test_car_2.describe_car





























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





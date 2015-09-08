



#Bloc
puts "This is with bloc"
p [3,4,5].each {|num| num + 1}


#Proc
puts "This is with proc"
add_one = Proc.new {|num| num + 1}

p add_one.(3,4,5)

#Lambda
puts "This is with lambda"
add_one_lambda = lambda {|num| num + 1}
p add_one_lambda.call(3)















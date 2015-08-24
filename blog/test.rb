def method_each(list)
	list.each {|x| x * 3}
end

def method_map(list)
	new_list = list.map {|x| x * 3}
end

def method_map!(list)
	list.map! {|x| x * 3}
end

list = ([1, 2, 3])
new_list = []
method_each(list)
puts "list each"
puts list
puts "list new_list each"
puts new_list

puts "Each method"

list = ([1, 2, 3])
method_map(list)
puts "list map"
puts list
puts "new_list map"
puts new_list

ist = ([1, 2, 3])
method_map!(list)
puts "list map!"
puts list
puts "new_list map!"
puts new_list


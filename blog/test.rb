
nested_array = [1, ["inner", "array"], 2, 3]
nested_hash = {:outer_key => {:inner_key => "Winner!"}}
desserts = {:favorite_dessert => "yellow cake", "second favorite dessert" => "cookies"}

nested_array.each {|element| p element}
p "puts nested_array" + nested_array
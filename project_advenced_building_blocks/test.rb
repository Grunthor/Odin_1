require_relative 'EnumerableMethods'
include Enumerable
# my_each test
x = [5,3,6,8,3,4,5,6,7,8]
x.my_each do |y|
    p y
end
#my_each_with_index test
x.my_each_with_index do |y,k|
    puts "#{k}: #{y}"
end
#my_select test
array = []
array = x.my_select do |y|
   y > 3 && y < 8  
end
puts array.inspect()
# my_all? test
z = x.my_all? do |k|
   k > 2 
end
puts z
#my_any test
z = x.my_any? do |k|
    k >12
end
puts z
# my_none test
z = x.my_none? do |k|
    k < 3
end
puts z
#my_count test
puts x.my_count
#my_map test
y = x.my_map {|k| k * 2}
puts y.inspect()
#my_inject
puts x.my_inject(:*)
puts x.multiply_els
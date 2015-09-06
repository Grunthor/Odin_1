#not refactored
def bad_exponents(numbers)
   numbers.map {|x| x**2} 
end
# refactored code
def good_exponents(numbers)
   numbers.map {|x| exponent(x)}
end

def exponent(number)
   number**2 
end
y = bad_exponents([2,3,4,5,6,7,8,9])
p y.inspect
z = good_exponents([2,3,4,5,6,7,8,9])
p z.inspect
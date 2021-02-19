=begin
input: integer
output: integer, reversed
explicit: 
- given signed 32-bit integer, return with its digits reversed
- if reversing x causes value to go outside the signed 32-bit integer range, return 0
- range: -2**31 <= x <= 2**31 - 1
data:

algorithm:
- create an array to store integers
- convert integers to array
- iterate and add element into new array, adding consecutive element to the front (unshift)
- cases
  - if last element in array is "-", add to front
  - if first element is 0, drop first element
- join and convert to integer    
- if converted int is outside limit, return 0
=end
require "pry"

def reverse(x)
  reverse_x_array = []
  x.to_s.chars.each do |int|
    reverse_x_array.unshift(int)
  end
  
  if reverse_x_array.last == "-"
    reverse_x_array.unshift(reverse_x_array.pop) 
  elsif reverse_x_array.first == "0"
    reverse_x_array.shift
  end

  return 0 if (reverse_x_array.join.to_i < -2**31) || (reverse_x_array.join.to_i > (2**31 - 1))

  reverse_x_array.join.to_i
end

p reverse(1534236469)
# p reverse(1534236469) == 0
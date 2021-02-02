=begin
Problem 1
input: two arguments (string, positive integer)
output:string 

rule: 
explicitas: print string as many times as the integer indicates
=end

# using a loop
# def repeat(str, num)
#   counter = 0
#   loop do
#     break if counter == num
#     puts str
#     counter += 1 
#   end
# end

#easier way
def repeat(str, num)
  num.times{ puts str }
end

#repeat('Hello', 3)#

=begin
Problem 2 - Odd
Input: one integer argument (positive, negative, or zero)
Output: Booleon
Explicit: 
- returns true if the number's absolute value is odd
- assume that the argument is a valid integer value.
Implicit:
- return false if not odd
Question:
- Is Zero considered even? Yes (test case)

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

Algorithm:
- when integer >= 0, is num.odd?
-when inter < 0
  -convert to positive
  -is num.odd?
- retrun false if anything else

=end

def is_odd?(num)
  # if num >= 0, 
    num.remainder(2) != 0
  # elsif num < 0
  #   num *= -1
  #   num % 2 != 0
  # else false 
  # end 
end
# modulo always returns a non-negatiev result if num on right is pos
# I also didn't need the absolute values anyway...

# puts is_odd?(2) == false
# puts is_odd?(5) == true
# puts is_odd?(-17) == true
# puts is_odd?(-8) == false
# puts is_odd?(0)  == false
# puts is_odd?(7) == true

=begin
Problem 3: List of Digits
Input: positive integer
Ouput: Array

Explicit: 
-Return a list of digits in the number
-no negative integers
Implicit: 
-input is valid number
-output is array
-zero returns zero?
Data
Number = 123
Array = [1, 2, 3]

Algorithm
-convert numbers into string
-split string into array
-loop through each element and convert into integer

=end
def digit_list(num)
  digit_array = num.to_s.split(//)
  digit_array.map { |str| str.to_i }
end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true


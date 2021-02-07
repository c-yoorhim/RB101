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

=begin
Problem 4
Input: array
Output: hash

Explicit Rule:
- counts the number of occurrences of each element in a given array.
- words in the array are case-sensitive: 'suv' != 'SUV'
- Once counted, print each element alongside the number of occurrences.

Algorithm:
- create a new hash 
- loop through each element in array
  - if element of array is a key in the hash
    - do nothing
  - else 
    - add element as new key in hash
    - add the count of element as value
-return hash
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(given_arr)
  counted_elements = {}

  given_arr.each do |element|      
    if counted_elements.has_key?(element)
      next
    else counted_elements[element] = given_arr.count(element)
    end
  end 
  
  counted_elements   
end

count_occurrences(vehicles) #== {
# 'car' => 4,
# 'truck' => 3,
# 'SUV' => 1,
# 'motorcycle' => 2
# }

=begin
Problem 5: Reverse It (Part 1)
Input: string
Output: new string
Explicit: 
- new string has words in reverse order
Implicit:
- word itself is not reversed
- only the order of the word is reversed
- empty returns empty
- capitalization is retained
Algorithm:
- convert wordsinto array using spaces as deliminater
- reverse the order of the words
- convert back to string with spaces
=end

def reverse_sentence(str)
  str.split(" ").reverse.join(" ")
end

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

=begin
Problem 6: Reverse It (Part 2)
Input: string 
Output: string

Explicit rules:
- string contains one or more words
- retruned string reverses words that contain five or more characters
- Each string will consist of only letters and spaces
- Spaces should be included only when more than one word is present

Algorithm
- convert str to array of words
- iterate through each word in the str
- if word.size > 4
  -transform word by: reverse letters in the word
- join words using spaces
=end

def reverse_words(str)
  str.split.map do |word| 
    
    if word.size > 4
      word.reverse
    else word
    end

  end.join(" ")
end

# puts reverse_words('Professional') == 'lanoisseforP'
# puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
# puts reverse_words('Launch School') == 'hcnuaL loohcS'

=begin
Problem 7: Stringy Strings
Input: a positive integer
Output: a string
Explicit rules:
- take integer and return string of alternating 1s and 0s:
  - always starting with 1
  - length of the string should match the given integer.
Question:
- 0 outputs ''?
Data:
integer
string

Algorithm:
-create an empty string
-if number > 0 [repeat number times]
  -add '1'
  -add '0'
-return string
=end

def stringy(int, start = 1)
  binary_str = ''
  for int in (start..int)
    binary_str << "1" if int.odd?
    binary_str << "0" if int.even?
  end
  binary_str
end

puts stringy(6,0)# == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

=begin
Problem 1: Cute angles
Input: floating point number
Output: string
- Write a method that takes a floating point number that represents an angle between 0 and 360 degrees
- and returns a String that represents that angle in degrees, minutes and seconds.
- You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds.
- A degree has 60 minutes, while a minute has 60 seconds.
- your results may differ slightly depending on how you round values, but should be within a second or two of the results shown in example.
- You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".
- You may use this constant to represent the degree symbol:

Data:
76.73 deg: 
76 == 76°
0.73deg == 0.73*60 = 43.8'
0.80' == 0.8*60 = 48"

deg = float
min = (float % deg) * 60)
sec = ( (min - min/1)  * 60)

round to floor of num

Algorithm:
1. convert float to deg, min, sec
2. format it with leading zero
=end

DEGREE = "\xC2\xB0"
CONVERSION = 60

def dms(num)
  return %(0#{DEGREE}00'00") if num == 0

  deg = num.floor
  min = (num % deg) * CONVERSION
  sec = (min-min.floor) * CONVERSION

  format(%(#{deg.floor}#{DEGREE}%02d'%02d"),min, sec)
end

# p dms(30)# == %(30°00'00")
# p dms(76.73)# == %(76°43'48")
# p dms(254.6)# == %(254°36'00")
# p dms(93.034773)# == %(93°02'05")
# p dms(0)# == %(0°00'00")
# p dms(360)# == %(360°00'00") || dms(360) == %(0°00'00")

=begin
Problem 2: Delete vowels 
Input: array of str
Output: same array
Explicit: 
- Write a method that takes an array of strings
- return an array of the same string values, except with the vowels (a, e, i, o, u) removed.
=end
VOWELS = %w(a e i o u A E I O U)

def remove_vowels(str_array)
  # str_array.map do |word|
  #   word.split('').reject { |letter| VOWELS.include?(letter) }
  #                 .join
  # end
  str_array.map { |word| word.delete('aeiouAEIOU') }
end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
Problem 3: Fibonacci Number Location By Length 
Input: int
Output: int
Explicit: 
- The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that:
  - the first 2 numbers are 1 by definition
  - each subsequent number is the sum of the two previous numbers.
- Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate.
- For example, the 100th Fibonacci number is 354,224,848,179,261,915,075
- Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. 
- (The first Fibonacci number has index 1.)
Data:
- Array: for index position
[0 1 1 2 3 5 8 13]
- Array[0] = 0
0  
1
1 1
1 1 2
1 1 2 3
Algorithm:
1. loop that creates an array with fibonacci series
2. stop when the number of digits of the current value is == input int
3. return the loop count at that value 
=end
require 'pry'

def find_fibonacci_index_by_length(int_length)
  index = 1
  f_array = [0, 1]
  loop do
    break if f_array.last.to_s.length == int_length
    f_array << f_array[0..1].sum
    f_array.shift
    index += 1
  end
  index
end

# p find_fibonacci_index_by_length(2) == 7          #0 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

=begin
Problem 4: Reversed Arrays (Part 1)
Input: array
Output: same array
- Write a method that takes an Array as an argument
- reverses its elements in place; that is, mutate the Array passed into this method. 
- return value should be the same Array object.
- You may not use Array#reverse or Array#reverse!.

Algorithm
1. iterate through the array using sort_by
2. sort_by index b <=> a

=end

 def reverse!(array)
  convert = array.size
  array.sort_by! do |element|
    array.index(element) + convert
    convert -= 2
  end
end

# list = [1,2,3,4]
# p result = reverse!(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# list = %w(a b e d c)
# p reverse!(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# p reverse!(list) == ["abc"] # true
# p list == ["abc"] # true

# list = []
# p reverse!(list) == [] # true
# p list == [] # true

=begin
Problem 5: Reversed Arrays (Part 2)
Input: array
Output: new array
Explicit: 
- Write a method that takes an Array
- returns a new Array with the elements of the original list in reverse order.
- Do not modify the original list.
- You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.
=end

def reverse(array)
  convert = array.size
  array.sort_by do |element|
    array.index(element) + convert
    convert -= 2
  end
end

reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

=begin
Problem 6: 
Input:
Output:
=end
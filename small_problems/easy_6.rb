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

# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# p reverse(['abc']) == ['abc']              # => true
# p reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# p new_list = reverse(list)              # => [2, 3, 1]
# p list.object_id != new_list.object_id  # => true
# p list == [1, 3, 2]                     # => true
# p new_list == [2, 3, 1]                 # => true

=begin
Problem 6: Combining Arrays
Input: 2 arrays
Output: array
Explicit:
- Write a method that takes two Arrays as arguments
- return an Array that contains all of the values from the argument Arrays
- There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.
Algorithm:
1. add arrays together
2. get only unique values in the array
=end
def merge(array1,array2)
  (array1 + array2).uniq
end

# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

=begin
Problem 7: Halvsies
Input: array
Output: pair nested arrays 
Explicit:
- Write a method that takes an Array as an argument
- returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. 
- If the original array contains an odd number of elements, the middle element should be placed in the first half Array.
Algorithm:
2. partition the array into 2: using index?
3. return nested array
=end
require 'pry'

def halvsies(array)
  a, b = array.partition { |num| array.index(num) <= ( (array.size.to_f/2).ceil - 1) }
  [a, b]
end

# p halvsies([1, 2, 3, 4])# == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3])# == [[1, 5, 2], [4, 3]]
# p halvsies([5]) #== [[5], []]
# p halvsies([])# == [[], []]

=begin
Problem 8: Find the Duplicate
Input: array 
Output: int?
Explicit:
- Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once)
- how would you determine which value occurs twice?
- Write a method that will find and return the duplicate value that is known to be in the array.
Data:
array
count?
int

Algorithm:
1. loop through, count value passed as argument
2. if count > 1, stop and return value.
=end

def find_dup(array)
index = 0
  loop do 
    num = array[index]
    return num if array.count(num) > 1
    index += 1
  end
end

# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

=begin
Problem 9: Does My List Include This?
Input: array, some search value (int? str?)
Output: boolean
Explicit:
- Write a method named include? that takes an Array and a search value as arguments.
- This method should return true if the search value is in the array, false if it is not.
- You may not use the Array#include? method in your solution.
Data:
array
search value: int or nil

Algorithm:
- iterate through the array values
- use bsearch
- account for when search value is nil

=end

def include?(array, value)
  !!(array.index(value))
end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

=begin
Problem 10: Right Triangles
Input: pos int
Output:
Explicit:
- Write a method that takes a positive integer, n, as an argument
- displays a right triangle whose sides each have n stars.
- The hypotenuse of the triangle (the diagonal side in the images below) should have:
  - one end at the lower-left of the triangle
  - the other end at the upper-right.
Algorithm:
- loop through and puts

=end

def triangle(int)
  int.times do |x| 
    print " " * (int - x - 1)
    puts "*" * (x + 1)
  end
end

triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

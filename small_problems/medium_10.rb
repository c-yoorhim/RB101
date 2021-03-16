=begin
problem 1: Rotation (Part 1)
Input: array
Output: new array
Write a method that rotates an array by moving the first element to the end of the array. 
The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.

Algorithm:
- map the array and duplicate from within the block, that way we can modify the duplicate without referencing back to the original object
- shift! first element
- append to the end
=end

def rotate_array(array)
  array = array.map(&:dup)
  array << array.shift
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

=begin
Problem 2: Rotation (Part 2)
Input:
Output: 
Write a method that can rotate the last n digits of a number. For example:

Algorithm:
- convert the int to str first
- get the index of the (-n) from the integer
- remove the digit at the -n position
  - sub() the nubmer from that position and replace it with ""
- append the digit at -n position to the end  
=end

def rotate_rightmost_digits(int, n)
  new_int = int.to_s.sub(int.to_s[-n],"")
  new_int << int.to_s[-n]
  new_int.to_i
end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

=begin
Problem 3: Rotation (Part 3)
- If you take a number like 735291, and rotate it to the left, you get 352917.
- If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
- Keep the first 2 digits fixed in place and rotate again to 321759.
- Keep the first 3 digits fixed in place and rotate again to get 321597.
- Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
- The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
Note that you do not have to handle multiple 0s.

Data:
(735291, 6): 352917
(352917, 5): 329175
(329175, 4): 321759
(321759, 3): 321597
(321597, 2): 321579

Algorithm:

=end

def max_rotation(int)
  n = int.to_s.length
  while n > 1
    int = rotate_rightmost_digits(int, n)
    n -= 1
  end
  int
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

=begin
Problem 4: 
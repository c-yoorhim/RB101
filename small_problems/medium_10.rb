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
Problem 4: 1000 Lights

You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially off.
You walk down the row of switches and toggle every one of them.
You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on.
On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on.
You repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Input: int
output: array
Explicit:
- input integer, represents how many lights there are.
- you will be passing through the entire line of switches, input-int times
- the nth time you pass through, you will be toggling the every nth switches
- whenever you toggle, you either switch ON or switch OFF (1, 0)
- return an array that identifies which lights are on after int repetitions:
  - every light is identifies by a number, the nth light
  - return an array of the n lights that are on

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Data:
- take the INT and use it to generate a HASH
- hash = {n => 0 or 1, n+1 => 0 or 1, etc.}
- array

Algorithm:
- 1. Generate a hash of light switches: 
  - (1..n) being the keys
    - (1..n).to_a: turn it into an array
    - iterate through the array to turn it into a key with value false
  - all the values are set to false
- 2. Iterate through (1..n)
  - at each nth iteration: make every nth key-value to the opposite:
    - nth iteration: if switch# % nth_pass == 0 at every switch#, make value opposite
      - need to pass through (1..n) switches at each iteration 
- return all keys where the value is true
  - keep if, value is true
  - return all keys, array format
=end

def on_lights(n)
  switch_hash = switch_hash(n)
  switch_on(n, switch_hash)
  switch_hash.keep_if { |switch_num, status| status == true }.keys
end

def switch_on(n, switch_hash)
  (1..n).to_a.each_with_object(switch_hash) do | nth_pass, switch_hash |
    (1..n).to_a.each do |switch_num|
      switch_hash[switch_num] = !switch_hash[switch_num] if switch_num % nth_pass == 0
    end
  end 
end

def switch_hash(n)
  switch_hash = {}
  (1..n).to_a.each { |switch| switch_hash[switch] = false }
  switch_hash
end

# p on_lights(5) == [1,4]
# p on_lights(10) == [1,4,9]
# p on_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

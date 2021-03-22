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

=begin
Problem 5: Diamonds!
- Write a method that displays a 4-pointed diamond in an n x n grid, 
  where n is an odd integer that is supplied as an argument to the method.
  You may assume that the argument will always be an odd integer.
  
Input: odd integer
Output: 4 pointed diamond in a nxn grid; string

Explicit:

Example:
diamond(1) =>

*
diamond(3)

 *         1: n/2 spaces, n*
***        2: row == n/2   
 *

 diamond(9)

    *         1: n/2 spaces, n* 
   ***         
  *****   3 - 2 spaces, 5 *
 *******  4 - 1 space, 7 * 
********* 5
 *******  6
  *****   7 - 4
   ***    8 - 6
    *     9 - 7

1 = return *
ELSE find mid row: 3=> 2; 9 => 5; n/2 + 1
(1..n) iterate throug |row|
  row: (midrow - 1)*spaces +  "*" (n-(spaces_count*2))* *
  row+1:(midrow - 2)*spaces + "*" *  UNTIL row == midrow
  after that:
  minus_row = 2
  row = row - (minus_row)
  minus_row -= 2
  row+1= row - (minus_row)
  UNTIL minus_row < 1

=end

def diamond(n)
  dia = '*'
  return dia if n == 1
  row_print_array = first_half_diamond(n).reverse
  row_print_array.shift
  row_print_array.each { |str| puts str }
  ''
end

def first_half_diamond(n)
  dia = '*'
  space = ' '
  mid_row= n/2 + 1
  space_count = mid_row - 1
  (1..mid_row).to_a.each_with_object([]) do |row, row_print_array|
    row_print = (space * space_count) + (dia * (n - (space_count*2)))
    puts row_print
    row_print_array << row_print.dup
    space_count -= 1
  end
end
# #center, #upto, #downto
# p diamond(9)

=begin
Problem 6: Stack Machine Interpretation

A stack is a list of values that grows and shrinks dynamically. 
In ruby, a stack is easily implemented as an Array that just uses the #push and #pop methods.
A stack-and-register programming language is a language that uses a stack of values. 
Each operation in the language operates on a register, which can be thought of as the current value. 
The register is not part of the stack. 
Operations that require two values pop the topmost item from the stack:
  that is, the operation removes the most recently pushed value from the stack, 
  perform the operation using the popped value and the register value,
  and then store the result back in the register.
Consider a MULT operation in a stack-and-register language. 
It multiplies the stack value with the register value, 
  removes the value from the stack, 
  and then stores the result back in the register. 
Thus, if we start with a stack of 3 6 4 (where 4 is the topmost item in the stack), 
  and a register value of 7, 
  then the MULT operation will transform things to 3 6 on the stack (the 4 is removed), 
  and the result of the multiplication, 28, is left in the register. 
  If we do another MULT at this point, 
    then the stack is transformed to 3, and the register is left with the value 168.

 [3,6,4]
 register = 7
 
 MULT =
[3,6,4].pop * 7 = 28
MULT =
[3,6].pop * 28 = 168

Input: str
Output: int
Explicit: 
- Write a method that implements a miniature stack-and-register-based programming language that has the following commands:
  - n: Place a value n in the "register". Do not modify the stack.
  - PUSH: Push the register value on to the stack. Leave the value in the register.
  - ADD: Pops a value from the stack and adds it to the register value, storing the result in the register.
  - SUB: Pops a value from the stack and subtracts it from the register value, storing the result in the register.
  - MULT: Pops a value from the stack and multiplies it by the register value, storing the result in the register.
  - DIV: Pops a value from the stack and divides it into the register value, storing the integer result in the register.
  - MOD: Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  - POP: Remove the topmost item from the stack and place in register
  - PRINT: Print the register value
All operations are integer operations (which is only important with DIV and MOD).
Programs will be supplied to your language method via a string passed in as an argument. 
Your program may assume that all programs are correct programs; 
  that is, they won't do anything like try to pop a non-existent value from the stack, and they won't contain unknown tokens.
You should initialize the register to 0.

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
n = 5 => register
PRINT => 5
PUSH: [5], register: 5
n = 3 => register
PRINT => 3
ADD: 5+3, register => 8
PRINT => 8
# 5
# 3
# 8

Algorithm:
- convert string of input into arrays: LANG
- create a variable for REGISTER
- create a variable for STACK
- shift from array: call it COMMAND
  - CASE command
    WHEN integer: return_value.to_i.to_s ==  return_value; put it into REGISTER
         PUSH: STACK.push(REGISTER)
         ADD: REGISTER += STACK.pop
         SUB: REGISTER -= STACK.pop
         MULT: register *= stack.pop
         DIV: register, _ = register.divmod(stack.pop)
         MOD: _, register = register.divmod(stack.pop)
         POP: register = stack.pop
         PRINT: register
  

=end
require 'pry'
def minilang(str_command)
  lang = str_command.split
  stack = []
  register = 0
  command = lang.shift.downcase

  loop do
    case command
    when command.to_i.to_s
      register = command.to_i
    when "push"
      stack.push(register)
    when "add"
      register += stack.pop
    when "sub"
      register -= stack.pop
    when "mult" 
      register *= stack.pop
    when "div"
      register, _ = register.divmod(stack.pop)
    when "mod"
      _, register = register.divmod(stack.pop)
    when "pop"
      register = stack.pop
    when "print"
      p register
    end
    break if lang.size == 0
    command = lang.shift.downcase
  end
end

# p minilang('PRINT')# == 0

# p minilang('5 PUSH 3 MULT PRINT')# == 15

# p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # # 5
# # 3
# # 8

# p minilang('5 PUSH POP PRINT')
# # # 5

# p minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # # 5
# # 10
# # 4
# # 7

# p minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# p minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# p minilang('-3 PUSH 5 SUB PRINT')
# # 8

# p minilang('6 PUSH')
# # # (nothing printed; no PRINT commands)

=begin
Problem 7: Word to Digit
Write a method that takes a sentence string as input, 
and returns the same string with any sequence of the words:
  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

input: str
output: same str
explicit: return the same string, but with any written out numbers from zero to nine, converted to its representive digit.

Example: 


Algorithm:
- create an array where word number index is the digit.
- iterate through the word array:
  - substitute word number with associated digit in the str
  - str.gsub(ITERATING_WORD_NUMBER, word_array.index(iterating_word_number).to_s)  
=end

WORDS_ARRAY = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

def word_to_digit(str)
  WORDS_ARRAY.each { |num_word| str.gsub!(num_word, WORDS_ARRAY.index(num_word).to_s) }
  str
end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

=begin
Problem 8: Fibonacci Numbers (Recursion)
=end

def fibonacci(n)
  return n if n < 2
  fibonacci(n-1) + fibonacci(n-2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2  
p fibonacci(4) == 3  
p fibonacci(5) == 5 
p fibonacci(6) == 8  
p fibonacci(12) == 144
p fibonacci(20) == 6765

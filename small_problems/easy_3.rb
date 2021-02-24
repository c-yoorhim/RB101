=begin
Problem 1: Searching 101
Explicit: 
- Input: integer
- Output: Str 
- Write a program that solicits 6 numbers from the user
- then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.
Question: 
- Do we need to verify that input is a number? Assume yes

Example:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

Data:
- array

Algorithm:
1. Prompt user
2. Get number
3. Store number into an array
4. Repeat until you have 5 numbesr
5. Prompt user for the last number
6. Check if the last number is included in the array.
7. Output result
=end
require "pry"

# def prompt(n)
#   puts "==> Enter the #{n}#{th_or_nd(n)} number:"
# end

# def th_or_nd(n)
#   case n 
#   when 1
#     "st"
#   when 2
#     "nd"
#   when 3
#     "rd"
#   when 4
#     "th"
#   when 5
#     "th"
#   when "last"
#     ""
#   end
# end

# def integer?(user_number)
#   user_number.to_i.to_s == user_number
# end

# n = 1
# number_array = []
# user_number = ''
# loop do
#   break if n > 5
  
#   loop do
#     prompt(n)
#     user_number = gets.chomp
#     break if integer?(user_number)
#   end
#   number_array << user_number.to_i
#   n += 1
# end

# prompt("last")
# user_number = gets.chomp.to_i

# if number_array.include?(user_number)
#   puts "The number #{user_number} appears in #{number_array}."
# else puts "The number #{user_number} does not appear in #{number_array}."
# end

=begin
Problem 2: Arithmetic Integer
Input: prompt from user, str
Output: integer? float?
Explicit:
- prompts the user for two positive integers
- prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power.
- Do not worry about validating the input
Examples:
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
Algorithm:
1. prompt user for first integer
2. convert to_i and store the answer to a variable
3. repeat 1&2 for second integer
4. Print the result of the operations

=end

# def prompt(msg)
#   puts "==> #{msg}"
# end

# prompt("Enter the first number:")
# first_num = gets.chomp.to_i
# prompt("Enter the second number:")
# second_num = gets.chomp.to_i
# prompt("#{first_num} + #{second_num} = #{first_num + second_num}")
# prompt("#{first_num} - #{second_num} = #{first_num - second_num}")
# prompt("#{first_num} * #{second_num} = #{first_num * second_num}")
# prompt("#{first_num} / #{second_num} = #{first_num / second_num}")
# prompt("#{first_num} % #{second_num} = #{first_num % second_num}")
# prompt("#{first_num} ** #{second_num} = #{first_num ** second_num}")

=begin
Problem 3: Counting the Number of Characters
Input: user input, str
Output: integer
Explicit: 
- ask a user for an input of a word or multiple words
- give back the number of characters.
- Spaces should not be counted as a character.
Example:
Input: Please write word or multiple words: walk
Output: There are 4 characters in "walk".

Input: Please write word or multiple words: walk, don't run
Output: There are 13 characters in "walk, don't run".

Algorithm:
1. ask user for words
2. store input into a variable
3. count characters in the variable
  - split word into array
  - join word without deliminater
  - find size of the str
4. display
=end

# print "Please write word or multiple words: "
# user_words = gets.chomp
# char_count = user_words.split.join.size
# puts "There are #{char_count} characters in \"#{user_words}\"."

=begin
Problem 4: Multiplying Two Numbers
Input: two arguments
Output: integer

Questiosn: 
-are the arguments integers?
-what happens if they are not?
-can we have floats?
-should the result be an integer

Exmaple:
multiply(5, 3) == 15

=end

def multiply(x,y)
  x * y
end

=begin
Problem 5: Squaring an Argument

Using the multiply method from the "Multiplying Two Numbers" problem, 
write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

=end

def square(x)
  square_total = multiply(x,x)
   x_pos = x.abs - 2
  until x_pos == 0 do
    square_total *= x.abs
    x_pos -= 1
  end

  return square_total if x > 0
  return -1r/square_total if x < 0
end

p square(5) == 5**5
p square(-8) == -8**-8

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

def prompt(n)
  puts "==> Enter the #{n}#{th_or_nd(n)} number:"
end

def th_or_nd(n)
  case n 
  when 1
    "st"
  when 2
    "nd"
  when 3
    "rd"
  when 4
    "th"
  when 5
    "th"
  when "last"
    ""
  end
end

def integer?(user_number)
  user_number.to_i.to_s == user_number
end

n = 1
number_array = []
user_number = ''
loop do
  break if n > 5
  
  loop do
    prompt(n)
    user_number = gets.chomp
    break if integer?(user_number)
  end
  number_array << user_number.to_i
  n += 1
end

prompt("last")
user_number = gets.chomp.to_i

if number_array.include?(user_number)
  puts "The number #{user_number} appears in #{number_array}."
else puts "The number #{user_number} does not appear in #{number_array}."
end

=begin
Problem 1: Short Long Short
Input: str
Output: str 
Explicit: 
- takes two strings as arguments
- determines the longest of the two strings
- returns the result of concatenating the shorter string, the longer string, and the shorter string once again. 
- You may assume that the strings are of different lengths.

Algorithm:
1. compare string sizes
2. create a new str variable
3. add shorter str to str variable'
4. add longer str
5. add shorter str again 

=end

def short_long_short(str1, str2)
  return str1 + str2 + str1 if str1.size < str2.size
  return str2 + str1 + str2  
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

=begin
Problem 2: What Century Is That
Input: year (int)
Output: century (str)
Explicit:
- takes a year as input
- returns the century 
- The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.
- New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Data:
case year
  year/100 + 1 = century number
  unless year year % 100 == 0, then it's year/100
case century ends in 
  1: st 
  2: nd
  3: rd
  (0,4..9): th
end

Algorithm:
1. Determine century using year
2. Return proper string value for that century
=end

def century_str(century)
  if [11,12,13].include?(century % 100) 
    'th'
  else
    case century.digits.first
    when 1
      'st'
    when 2
      'nd'
    when 3
      'rd'
    else
      'th'
    end
  end
end

def century(year)
  century = year / 100
  century = (year/100) + 1 unless year % 100 == 0 
  "#{century}#{century_str(century)}"
end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

=begin
Problem 3: Leap year (Part 1)
Input: year > 0, int
Output: boolean (true if leap year)
Explicit:
- leap years occur in every year that is:
  - evenly divisible by 4
  - except/unless the year is also divisible by 100
    - then it is not a leap year, unless the year is evenly divisible by 400.

- Assume this rule is good for any year greater than year 0. 
- Write a method that takes any year greater than 0 as input
- returns true if the year is a leap year, or false if it is not a leap year.

Algorithm:
cases year
when year % 400 == leap
when year % 100 == not leap
when year % 4 == leap


=end

def leap_year?(year)
  year % 400 == 0 ? true : ( 
    year % 100 == 0 ? false : ( 
      year % 4 == 0 ? true : false
    )
  )
end

# # explore further
# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       if year % 400 == 0
#         true
#       else false
#       end
#     else true
#     end 
#   else false
#   end 
# end

=begin
Problem 4: Leap Years (Part 2)
Input: 
Output:
Explicit:
- The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
- Prior to 1752, the Julian Calendar was used.
- Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.
- Using this information, update the method from the previous exercise to determine leap years both before and after 1752.
=end

def leap_year?(year)
  if year > 1752
    year % 400 == 0 ? true : ( 
      year % 100 == 0 ? false : ( 
        year % 4 == 0 ? true : false
      )
    )
  else year % 4 == 0
  end
end

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

=begin
Problem 5: Multiples of 3 and 5
Input: integer 
Output: integer
Explicit:
- Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number
- then computes the sum of those multiples. 
- For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
- You may assume that the number passed in is an integer greater than 1.

Data:
- integer
- array

Algorithm:
- For (1..int): select numbers when int % 3== 0 or int % 5 == 0
- add sum of all the elements in the array
=end

def multisum(int)
  (1..int).select { |num| (num % 3 == 0) || (num % 5 == 0) }.reduce(:+)
end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

=begin
Problem 6: Running Totals
Input: array (of int)
Output: array of same size
Explicit:
- Write a method that takes an Array of numbers
- returns an Array with the same number of elements, and each element has the running total from the original Array.
- [] returns []

Algorithm:
1. iterate through the argument array
2. create a variable to store sum and returned as the new elemtn in that position

=end

def running_total(array)
  sum = 0
  array.map { |num| sum += num }

  # sum = 0
  # array.each_with_object([]) do |num, new_array|
  #   sum += num
  #   new_array << sum
  # end

  # array.inject([]) { |new_arr, num| new_arr << new_arr.last.to_i + num }
end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

=begin
Problem 7: Convert a String to a Number!
Input:  str (of digits)
Output: return num as an integer
Explicit:
- The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer.
- String#to_i and the Integer constructor (Integer()) behave similarly. 
- In this exercise, you will create a method that does the same thing.
- Write a method that takes a String of digits, 
- and returns the appropriate number as an integer
- You may not use any of the methods mentioned above.
- For now, do not worry about leading + or - signs, nor should you worry about invalid characters; 
- assume all characters will be numeric.
- You may not use any of the standard conversion methods available in Ruby to convert a string to a number
   - such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Algorithm:
1. NUMBERS = {"0" => 0, "1" => 1, "2" => 2, "3" => 3...}
2. iterate through string, and check which corresponding integer value it is from the NUMBERS hash
3. put each digit in an array
4. find size of array
5. iterate through array and sum: num * 10^array array, reduce array size by 1
6. return sum

=end

NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(str_int)
  exp = str_int.length - 1
  int_array = str_int.chars.each_with_object([]) do |str, arr| 
                arr << NUMBERS[str] * (10**exp)
                exp -= 1
              end
  int_array.inject(:+)
end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

=begin
Problem 8: Convert a String to a Signed Number!
Input:  
Output: 
Explicit:
- In the previous exercise, you developed a method that converts simple numeric strings to Integers. 
- In this exercise, you're going to extend that method to work with signed numbers.
- Write a method that takes a String of digits, and returns the appropriate number as an integer. 
- The String may have a leading + or - sign; 
  - if the first character is a +, your method should return a positive number; 
  - if it is a -, your method should return a negative number. 
  - If no sign is given, you should return a positive number.
- You may assume the string will always contain a valid number.
- You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Algorithm:
1. check if first character has -, if it does, add - to value
=end

def string_to_signed_integer(str_int)
  # str_array = str_int.chars
  # if str_array.first == "-"
  #   str_array.shift
  #   string_to_integer(str_array.join) * -1
  # elsif str_array.first == "+"
  #   str_array.shift
  #   string_to_integer(str_array.join)
  # else string_to_integer(str_int)
  # end
  if str_int[0].key?(NUMBER)
    string_to_integer(str_int)
  else string_to_integer(str_int[1..-1])
  end
end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

=begin
Problem 9: Convert a Number to a String!
Input:  
Output: 
Explicit:
- Write a method that takes a positive integer or zero, and converts it to a string representation.
- You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.
Data:
str.unshift(NUMBER.key(4321 % 10 == 1))
value = 4321/10
=end

def integer_to_string(int)
  str = ''
  return '0' if int == 0
  loop do
    break if int == 0
    str.prepend(NUMBERS.key(int % 10))
    int /= 10
  end
  str
end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

=begin
Problem 10: Convert a Signed Number to a String!
Input:  int
Output: str
Explicit:
- Write a method that takes an integer, and converts it to a string representation.
=end

def signed_integer_to_string(int)
  return '0' if int == 0
  return ('+' + integer_to_string(int)) if int > 0
  return ('-' + integer_to_string(int*-1))
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

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

# def leap_year?(year)
#   year % 400 == 0 ? true : ( 
#     year % 100 == 0 ? false : ( 
#       year % 4 == 0 ? true : false
#     )
#   )
# end

# explore further
def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      if year % 400 == 0
        true
      else false
      end
    else true
    end 
  else false
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
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

=begin
Problem 4: 
Input:
Output:
Explicit:
=end
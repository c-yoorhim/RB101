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
Problem 3:
Input:
Output:
Explicit:
=end
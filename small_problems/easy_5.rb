require "pry"
=begin
Problem 1: ASCII String Value
Input: str 
Output: int
Explicit:
- Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. 
- The ASCII string value is the sum of the ASCII values of every character in the string. 
(You may use String#ord to determine the ASCII value of a character.)

Data:
"a".ord == 97

Algorithm:
1. convert string to array
2. sum the .ord value of each element in the array
=end

def ascii_value(str)
  str.chars.map(&:ord).sum
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

=begin
Problem 2: After Midnight (Part 1)
Input: int time (min-based format)
Output: 24 hour format (hh:mm), str?
Explicit:
- The time of day can be represented as the number of minutes before or after midnight.
- If the number of minutes is positive, the time is after midnight.
- If the number of minutes is negative, the time is before midnight.
- Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).
- Your method should work with any integer input.
- You may not use ruby's Date and Time classes.

Data:
0 == "00:00", midnight
-int == minutes BEFORE midnight
  minutes divmod 60 == hour, minutes before midnight
+ int == minutes AFTER midnight
  minutes divmod 60 == hour, minutes
=end
def prompt(hour, minute)
  case hour <=> 9
  when 1 
    str_hour = hour.to_s
  else str_hour = "0#{hour}"
  end

  case minute <=> 9
  when 1 
    str_min = minute.to_s
  else str_min = "0#{minute}"
  end

  "#{str_hour}:#{str_min}"
end

def time_of_day(int)
  if int >= 0
    hour, minute = int.divmod(60)
    hour /= 24 if hour > 24
  else 
    hour, minute = int.divmod(60)
    if (hour < -24) || ( (hour > 0) && (hour < 24))
      _, hour = hour.divmod(24)-
    else hour += 24
    end
  end 
  prompt(hour, minute)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
Problem 3:
Input:
Output:
Explicit:
=end
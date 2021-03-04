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
      _, hour = hour.divmod(24)
    else hour += 24
    end
  end 
  prompt(hour, minute)
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

=begin
Problem 3: After Midnight (Part 2)
Input:
Output:
Explicit:
- Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. 
- Both methods should return a value in the range 0..1439.
Algorithm: after midnight
1. seprate hours and minutes from str
2. take hours, % 24
3. convert hours to minutes
4. add hours in minutes to minutes

Algorithm: before midnight
1. seprate hours and minutes from str
2. take hours, % 24
3. convert hours to minutes
4. add hours in minutes to minutes
5. sub total minutes from total min in day
=end

HOURS_IN_DAY =  24
MINUTES_IN_HOUR = 60
TOTAL_MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

def after_midnight(str)
  hour = str[0..1].to_i
  minutes = str[-2..-1].to_i
  hour %= 24
  minutes += (hour * MINUTES_IN_HOUR)
  minutes
end

def before_midnight(str)
  minutes = after_midnight(str)
  return 0 if minutes == 0
  minutes = TOTAL_MINUTES_IN_DAY - minutes 
end

# p after_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p after_midnight('24:00') == 0

# p before_midnight('00:00') == 0
# p before_midnight('12:34') == 686
# p before_midnight('24:00') == 0

=begin
Problem 4: Letter Swap
Input: str of words
Output: str
Explicit:
- Given a string of words separated by spaces
- returns a string in which the first and last letters of every word are swapped.
- You may assume: 
  - that every word contains at least one letter
  - the string will always contain at least one word 
  - You may also assume that each string contains nothing but words and spaces
-case sensitive

Algorithm:
1. split the words by spaces
2. for each word make the last letter the first letter
3. join by spaces
=end

def swap(str) # I can use multi-assignment syntax to refactor
  swapped_array = str.split(' ').map do |word|
                    if word.size > 1
                      first_letter = word[0]
                      last_letter = word[-1]
                      word.chop!
                      word[0] = last_letter
                      word << first_letter
                    end
                    word
                  end
  swapped_array.join(' ')
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

=begin
Problem 5: Clean up the words
Input: string that consists of some words (all lowercased) and an assortment of non-alphabetic characters
Output: string
Explicit:
- return string with all of the non-alphabetic characters replaced by spaces. 
- If one or more non-alphabetic characters occur in a row, you should only have one space in the result
- the result should never have consecutive spaces
Question:
- mutate in place?
- retrun new string?

Algorithm:
1. iterate through the characters in the string
2. if the character is included in (a..z); leave as is
3. if it's not, replace with ' '
4. if character before is also not (a..z), don't add the extra ' '
=end

# ALPHABET = ('a'..'z').to_a

# def cleanup(str)
#   new_str = ''
#   str.chars.each_with_object(new_str) do |char, new_str|
#     if !(ALPHABET.include?(char))
#       next if new_str[-1] == ' ' 
#       new_str << ' ' 
#     else new_str << char
#     end 
#   end
# end

def cleanup(str)
  str.gsub(/[^a-z]/i,' ').squeeze(' ')
end

# p cleanup("---what's my +*& line?")# == ' what s my line '

=begin
Problem 6: Letter Counter (Part 1)
Input: string with one or more space separated words
Output: hash
Explicit:
- returns a hash that shows the number of words of different sizes.
- Words consist of any string of characters that do not include a space.
- empty return empty hash
Data:
Four = 4
score = 5
and = 3
seven. = 6
== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }

Algorithm:
0. create a new hash
1. iterate through each "word" separated by spaces
1.5. If "word" ==  nil, return {}
2. For each word, count the characters
3. Check if the count number is a key in the hash
4. if it is, increase the key value by 1
5. if it is not, create a new key with the count value, and make the hash value for that key == 1 
=end

# def word_sizes(str)
#   word_count_hash = Hash.new(0) # this forces any non-existing keys in the hash to return 0 value
#   str.squeeze(' ').split.each_with_object(word_count_hash) do |word|
#     # return if word == nil
#     # if word_count_hash.key?(word.length)
#     #   word_count_hash[word.length] += 1
#     #else 
#     word_count_hash[word.length] += 1
#     #end
#   end
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

=begin
Problem 7: Letter Counter (Part 2)
Input: 
Output:
Explicit:
- Modify the word_sizes method from the previous exercise to exclude:
  - non-letters when determining word size. 
  - For instance, the length of "it's" is 3, not 4.
=end
def word_sizes(str)
  word_count_hash = Hash.new(0)
  str.squeeze(' ').split.each_with_object(word_count_hash) do |word| 
    #word_count_hash[word.gsub(/[^a-z]/i,'').length] += 1
    word_count_hash[word.delete('^a-zA-Z').length] += 1
  end
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

=begin
Problem 8: Alphabetical Numbers
Input: array of integers between 0 - 19
Output: sorted array
Explicit:
- Write a method that takes an Array of Integers between 0 and 19
- returns an Array of those Integers sorted based on the English words for each number:
zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Algorithm:
1. create an array of integer words
3. for each element, look up the english word using the integer as index of the english word array
4. sort the element by the alphabetical order of the english word
  - create a hash using the word array
  - sort by value in a hash, which will return nested array
  - iterate through the nested array, put the first element in a new array
  - return the new array
=end


INTEGER_ENGLISH_WORD = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]

def alphabetic_number_sort(array)
  # int_hash = {}
  # array.each_with_object(int_hash) do |int|
  #   int_hash[int] = INTEGER_ENGLISH_WORD[int]
  # end
  # int_hash.sort_by {|int, word| word}.map do |int_word_pair|
  #   int_word_pair[0]
  # end
  array.sort_by { |int| INTEGER_ENGLISH_WORD[int] }
end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

=begin
Problem 9: ddaaiillyy ddoouubbllee
Input: string
Output: new string
Explicit:
- Write a method that takes a string argument
- returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.
- You may not use String#squeeze or String#squeeze!.

Algorithm:
1. iterate through string letters
2. send each char into a new string
3. if last char of the string == the current char in iteration, don't send to string
4. return new string
=end

def crunch(str)
  new_str = ''
  str.chars.each_with_object(new_str) do |char|
    new_str << char if !(new_str[-1] == char)
  end
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

=begin
Problem 10: Bannerizer
Input: str
Output: str
Explicit:
- Write a method that will take a short line of text, and print it within a box.
Algorithm:
- if blank:
+--#{dash}+
|  |
| #{str} |
|  |
+--#{dash}+
=end

def add_char(str_size, char)
  str = ''
  (1..str_size).each_with_object(str) { |int| str << char }
end

def print_in_box(str)
  puts "+--#{add_char(str.size, '-')}+"
  puts "|  #{add_char(str.size, ' ')}|"
  puts "| #{str} |"
  puts "|  #{add_char(str.size, ' ')}|"
  puts "+--#{add_char(str.size, '-')}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('One more Easy 5 problem to go!')

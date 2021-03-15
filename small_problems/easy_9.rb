=begin
Problem 1: Welcome Stranger
Input: array, hash
Output: str
- Create a method that takes 2 arguments, an array and a hash.
  - The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name.
  - The hash will contain two keys, :title and :occupation, and the appropriate values.
- Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

Algorithm:
- Convert array to name_string
- Access title and occupation
- Prompt string
=end

def greetings(array, hash)
  name = array.map(&:capitalize).join(" ")
  "Hello, #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

# p greetings(['john', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

=begin
Problem 2: Double Doubles
Input: int
Explicit: int
- A double number is a number with an even number of digits:
  - whose left-side digits are exactly the same as its right-side digits.
  - For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
- Write a method that returns 2 times the number provided as an argument, unless
  - the argument is a double number; 
  - double numbers should be returned as-is.
Algorithm:
- Determine if the input is a double number
  - even number of digits
  - (0..(digit_length/2)-1) == (digit_length/2)..-1 
- If it is, return the double number
- If it is not: return (2 * input number)
*consider different format?

=end

def double_number?(int)
  int_str = int.to_s
  return false if int_str.length < 2
  half_point = int_str.length/2
  int_str[0..(half_point-1)] == int_str[half_point..-1]
end

def twice(int)
  return int if double_number?(int)
  int * 2
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

=begin
Problem 3: Always Return Negative
Input: int
Output: int
Explicit:
- Write a method that takes a number as an argument.
- If the argument is a positive number, return the negative of that number.
- If the number is 0 or negative, return the original number.
Algorithm:
- IF int <= 0, return self
- ELSE return -self
=end

def negative(int)
  return int if int <= 0
  -int
end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

=begin
Problem 4: Counting Up
Input: int
Output: array
- Write a method that takes an integer argument
- returns an Array of all integers, in sequence, between 1 and the argument.
- You may assume that the argument will always be a valid integer that is greater than 0.

=end

def sequence(int)
  (1..int).to_a
end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

=begin
Problem 5: Uppercase Check 
Input: str
Output: boolean
Explicit:
- Write a method that takes a string argument
- returns true if all of the alphabetic characters inside the string are uppercase, false otherwise.
- Characters that are not alphabetic should be ignored.
=end

def uppercase?(str)
  str.upcase == str
end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

=begin
Problem 6: How long are you?
Input: str
Output: array
Explicit:
- Write a method that takes a string as an argument
- returns an Array that contains every word from the string, to which you have appended a space and the word length.
- You may assume:
  - that words in the string are separated by exactly one space
  - any substring of non-space characters is a word.
Algorithm:
- convert str to array, separated by space
- find length of each word
- concatenate word length to the word
- return array with concatenated word and word length
=end

def word_lengths(str)
  str.split.map { |word| word << " #{word.length}" }
end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []

=begin
Problem 7: Name Swapping
Input: str
Ouput: str
Explicit:
- Write a method that takes a first name, a space, and a last name passed as a single String argument,
- returns a string that contains the last name, a comma, a space, and the first name.
=end
def swap_name(fullname)
  "#{fullname.split[-1]}, #{fullname.split[-0]}"
end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

=begin
Problem 8: Sequence Count
Input: 2 int
Ouput: array
Explicit:
- Create a method that takes two integers as arguments.
- The first argument is a count
- the second argument is the first number of a sequence that your method will create.
- The method should return an Array that contains the same number of elements as the count argument,
- while the values of each element will be multiples of the starting number.
- You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.
=end

def sequence(size, start_int)
  return_array= []
  sum = 0
  loop do
    break if return_array.size == size
    sum += start_int
    return_array << sum
  end
  return_array
end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

=begin
Problem 9: Grade book
Input: 3 int
Output: str
Explicit:
- Write a method that determines the mean (average) of the three scores passed to it,
- and returns the letter value associated with that grade.
Algorithm:
- create hash for grades
- find average
- look up average in hash
  - iterate through value of range
  - check if average is included in range?
  - if within range, return key

=end

SCORE = {A: (90..100), B: (80..89), C: (70..79), D: (60..69), F: (0..59)}

def get_grade(gr1, gr2, gr3)
  grades_array = [gr1,gr2,gr3]
  average = grades_array.sum / grades_array.size
  SCORE.each_value do |grade_range|
    return SCORE.key(grade_range).to_s if grade_range.include?(average)
  end
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

=begin
Problem 10: Grocery List
Input: nested array
Output: array
- Write a method which takes a grocery list (array) of fruits with quantities
- converts it into an array of the correct number of each fruit.
Algorithm:
- iterate through array
- transform the array so that: takes word and multiply by int
- flatten the nested array and return
=end

def buy_fruit(nested_array)
  nested_array.map { |array| [array[0]] * array[-1] }.flatten
end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","banan
#   as"]

=begin
Problem 11: Group Anagrams 
Input: array
output: arrays
Explicit:
- Write a program that prints out groups of words that are anagrams.
- Anagrams are words that have the same exact letters in them but in a different order.

Algorithm:
- iterate through words
- create a hash where a reordered word is a key
- if hash key exist, add the word in an array
- if it doesn't exist, create the key, add the word in the array
- return value of hash

=end

def group_anagrams(words_array)
  anagram_hash = words_array.each_with_object({}) do |word, anagram_hash|
    sorted_word = word.chars.sort.join
    anagram_hash.key?(sorted_word) ? anagram_hash[sorted_word] += [word] : anagram_hash[sorted_word] = [word]
  end
  anagram_hash.each_value { |array| p array }
  return
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p group_anagrams(words)

          # ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

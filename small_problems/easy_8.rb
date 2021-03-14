=begin
Problem 1: Sum of Sums
Input: array of numbers
Output: int 
Explicit:
- Write a method that takes an Array of numbers and 
- then returns the sum of the sums of each leading subsequence for that Array. 
- You may assume that the Array always contains at least one number.

Data
[3, 5, 2]
(3) + (3 + 5) + (3 + 5 + 2)


Algorithm:
- iterate through the array

using index and range:
- put the first element in a sum
- take sum of first two elements, add it to the sum
- take the sum of first 3 elements, add it to the sum

- repeat until you've summed the entire length of the area.

=end

def sum_of_sums(array)
  sum = 0
  array.each_with_index() do |int, index|
    sum += array[0..index].sum
  end
  sum
end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin
Problem 3: Leading Substrings
Input: str
Output: array
Explicit:
- Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
- The return value should be arranged in order from shortest to longest substring.

Implictit:
- It can have nonalphabets
- assume spaces count as part of substring

Algorithm:
- iterate through string by each character
- return a new object
- at each iteration, return a new string that gets pushed into the object
  - the new string should be all characters from 0 up to that point in the iteration
- repeat until we're at the last character iteration
- return the new object that has all the substrings
- the returning array size should equal the length of the string

=end

def leading_substrings(str)
  substring_array = []
  str.chars.each_with_index do |char, index|
    substring_array << str[0..index]
  end
  substring_array
end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# p leading_substrings('12x -') == ['1', '12', '12x', '12x ','12x -']

=begin
Problem 4: All Substrings
Input:
Output:
Explicit:
- Write a method that returns a list of all substrings of a string.
- The returned list should be ordered by where in the string the substring begins.
- This means that:
  - all substrings that start at position 0 should come first,
  - then all substrings that start at position 1, and so on.
- Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
- You may (and should) use the leading_substrings method you wrote in the previous exercise:

Data:
- take the first char, display all the substrings
- take the second char, display all substring
- take third chra, etc.
- until you readch the last character

Algorithm:
- create an [] to store all substrings
- start with leading_substrings(str), push all substrings to []
- when finished, shift first char, pass as argument to leading substring, push all substrings to []
- repeat until str length == 0
=end

def substrings(str)
  all_substrings = []
  loop do
    break if str.length == 0
    all_substrings += leading_substrings(str)
    str.slice!(0)
  end
  all_substrings
end

# p substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

=begin
Problem 5:Palindromic Substrings
Input: string
Output: array
Explicit:
- Write a method that returns a list of all substrings of a string that are palindromic.
- That is, each substring must consist of the same sequence of characters forwards as it does backwards.
- The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
- You may (and should) use the substrings method you wrote in the previous exercise.
- For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. 
- In addition, assume that single characters are not palindromes.

Algorithm:
- iterate through the return value of the substrings method
- select any palindromes
  - palindromes = str == str.reverse, this should account for cases
=end

def palindromes(str)
  substrings(str).select { |substring| substring.length > 1 }
                 .select { |substring| substring == substring.reverse }
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

=begin
Problem 6: fizzbuzz 
Input: int, int
Output: 
Explicit:
- Write a method that takes two arguments: the first is the starting number, and the second is the ending number.
- Print out all numbers between the two numbers,
  - except if: a number is divisible by 3, print "Fizz",
  - if a number is divisible by 5, print "Buzz",
  - if a number is divisible by 3 and 5, print "FizzBuzz".

Algorithm:
- iterate through range from (start_int..end_int)
- if num passed % 3 == 0 && % 5 == 0, print "FizzBuzz"
- if num passed % 3 == 0, print "Fizz"
- elsif num passed % 5 == 0, print "Buzz"
- else print num
=end

def fizzbuzz(start_int, end_int)
  (start_int..end_int).each_with_object("") do |num, string|
    if (num % 3 == 0) && (num % 5 == 0) 
      string << "Fizzbuzz"
    elsif num % 3 == 0
      string << "Fizz"
    elsif num % 5 == 0
      string << "Buzz"
    else string << num.to_s
    end
    string << ", " unless num == end_int
  end
end

# p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

=begin
Problem 7: Double Char (Part 1) 
Input: str
Output: new str
Explicit:
- Write a method that takes a string
- returns a new string in which every character is doubled.
Algorithm:
- iterate through the string's char
- new_str << char * 2
=end
def repeater(str)
  str.chars.each_with_object("") do |char, new_str|
    new_str << char*2
  end
end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

=begin
Problem 8: Double Char (Part 2) 
Input: str
Output: new str
Explicit:
- Write a method that takes a string
- returns a new string in which every consonant character is doubled.
- Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Algorithm: regex
- create a conditional with regex
  - how do i account for digits, punctuation and whitespace?
=end

CONSONANTS = (('a'..'z').to_a + ('A'..'Z').to_a).select { |char| char =~ /[^aeiou]/i }

def double_consonants(str)
  str.chars.each_with_object("") do |char, new_str|
    if CONSONANTS.include?(char)
      new_str << char*2
    else new_str << char
    end
  end
end

# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

=begin
Problem 9: Reverse the Digits In a Number
Input: pos int
Output: int 
Explicit:
- Write a method that takes a positive integer as an argument
- returns that number with its digits reversed.
Implicit:
- no leading zeros

Algorithm:
- convert int to str
- str.reverse
- convert back to int

=end

def reversed_number(int)
  int.to_s.reverse.to_i
end

# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

=begin
Problem 10: Get The Middle Character
Input: non empty str
Output: str
Explicit:
- Write a method that takes a non-empty string argument
- and returns the middle character or characters of the argument.
- If the argument has an odd length, you should return exactly one character.
- If the argument has an even length, you should return exactly two characters.
Implicit:
- spaces count as char
- single char return itself

Algorithm:
1 is length even? is it odd?
2 Find the center
- for odd, return 1 char at the center
- for even, return 2 char at the center
- return char
=end

def center_of(str)
  middle = (str.length / 2)
  return str[middle] if str.length.odd?
  return str[(middle-1)..(middle)]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

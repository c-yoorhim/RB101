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

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

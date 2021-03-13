=begin
Problem 1: Combine Two Lists
Input: two arrays
Output: new array
Explicit:
- Write a method that combines two Arrays passed in as arguments
- returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
- You may assume that both input Arrays are non-empty, and that they have the same number of elements.
Algorithm:
- create a variable to hold new array
- create loop with index at 0
- add array element from the index position from both arrays
- increase index, break when index > arr size
=end

# original
# def interleave(arr1, arr2)
#   new_array = []
#   index = 0
#   loop do
#     break if index == arr1.size
#     new_array << arr1[index]
#     new_array << arr2[index]
#     index += 1
#   end
#   new_array
# end

#using each_with_index
# def interleave(arr1, arr2)
#   new_array = []
#   arr1.each_with_index {|elem, index| new_array << elem << arr2[index] }
#   new_array
# end

#using zip
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

=begin
Problem 2: Lettercase Counter
Input: string
Output: hash 
Explicit:
- Write a method that takes a string
- returns a hash that contains 3 entries: 
  - one represents the number of characters in the string that are lowercase letters, 
  - one the number of characters that are uppercase letters, 
  - and one the number of characters that are neither.

Algorithm:
- count lowercase, uppercse and neither characters in each string
  - iterate through the string character
  - identify whether the character is lower, upper or neither
- create a hash with key for each category and value for each count
=end

# LOWERCASE = ('a'..'z').to_a
# UPPERCASE = ('A'..'Z').to_a

def letter_case_count(str)
  count_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if LOWERCASE.include?(char)
      count_hash[:lowercase] += 1
    elsif UPPERCASE.include?(char)
      count_hash[:uppercase] += 1
    else count_hash[:neither] += 1
    end
  end
  count_hash
end

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
Problem 3: Capitalize Words
Input: str
Output: new str 
Explicit:
- Write a method that takes a single String argument\
- returns a new string that:
  - contains the original value of the argument
  - the first character of every word capitalized
  - all other letters lowercase.
- You may assume that words are any sequence of non-blank characters.

Data:
str -> array
# change the elements of the array

array -> new string
Algorithm:
- Separate/isolate each word in the string
- Capitalize the first character
- Every charcter after the first one becomes lowercase
- Return new string of modified words
=end

def word_cap(str)
  str.split.map(&:capitalize).join(" ")
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin
Problem 4: Swap Case
Input: str
Output: new str 
Explicit:
- Write a method that takes a string as an argument
- returns a new string in which:
  - every uppercase letter is replaced by its lowercase version, 
  - and every lowercase letter by its uppercase version. 
  - All other characters should be unchanged.
- You may not use String#swapcase; write your own version of this method.

Algorithm:
- Identify if character is lowercase vs. uppercase
  - create CONSTANTS for each lowercase and uppercase
  - iterate through the string by each char
- Find the "opposite" case
  - the "opposite" case will have te same index position
  - so call the index of the "opposite" case
- Swap
  - create a new string
  - add the swapped letter to the new str
- if not letter, leave it as is

=end

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def swapcase(str)
  str.chars.each_with_object('') do |char, new_str|
    if LOWERCASE.include?(char)
      new_str << UPPERCASE[LOWERCASE.index(char)]
    elsif UPPERCASE.include?(char)
      new_str << LOWERCASE[UPPERCASE.index(char)]
    else new_str << char
    end
  end
end

# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

#learn regex!

=begin
Problem 5: Staggered Caps (Part 1)
Input: string
Output:  new string
Explicit:
- Write a method that takes a String as an argument
- returns a new String that contains the original value using a staggered capitalization scheme:
  - in which every other character is capitalized
  - and the remaining characters are lowercase. 
- Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

Algorithm:
- Iterate through the string characters
- Determine if the char should be lowercase or uppercase
    -first letter is always capitalized, even index
- Determine if char is lowercase or uppercase
- Put the right letter in the new string

=end

def staggered_case(str)
  new_str = ''
  str.chars.each_with_index do |char, index|
    new_str << char.upcase if index.even?
    new_str << char.downcase if index.odd?
  end
  new_str
end

# p staggered_case('I Love Launch School!')== 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin
Problem 6: Staggered Caps (Part 2)
Input: string
Output:  new string
Explicit:
- Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter.
- The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

Algorithm:
- iterate through the str characters
- Start with uppercase
- If next character is alphabetic, change to lowercase
- If char is non-alphabetic, do nothing
- send char to new string
=end

def staggered_case(str)
  uppercase = true
  str.chars.each_with_object('') do |char, new_str|
    if (char =~ /['a-zA-Z']/i) 
      if uppercase
        new_str << char.upcase
      else 
        new_str << char.downcase
      end
      uppercase = !uppercase
    else new_str << char
    end
  end
end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

=begin
Problem 7: Multiplicative Average
Input: array of int
Output: float

Explicit:
- Write a method that takes an Array of integers as input
- Result:
  - multiplies all the numbers together, 
  - divides the result by the number of entries in the Array,
  - and then prints the result rounded to 3 decimal places.
- Assume the array is non-empty.

Data:
- array
- array.size
- float (3 decimal places)

[3,5]
3 * 5 == 15
15 / 2 = 7.500

Algorithm:
- Multiply all the numbers in the array: inject(:*)
- divide by the size
- use int format add additional 0?
=end

def show_multiplicative_average(array)
  result = (array.inject(:*).to_f / array.size)
  "The result is #{format('%.3f',result)}"
end

# p show_multiplicative_average([3, 5])                # => The result is 7.500
# p show_multiplicative_average([6])                   # => The result is 6.000
# p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

=begin
Problem 8: Multiply Lists
Input: 2 arrays 
Output: new array
Explicit:
- Write a method that takes two Array arguments
  - in which each Array contains a list of numbers
- returns a new Array that:
  - contains the product of each pair of numbers from the arguments that have the same index.
- You may assume that the arguments contain the same number of elements.

Data
  [3, 5, 7]
x [9, 10, 11]

0 : 3 * 9 = 27
1 : 5 * 10 = 50
2 : 7 * 11 = 77

Algorithm:
- loop through using a counter
=end

# def multiply_list(array1, array2)
#   index = 0
#   new_array = []
#   loop do 
#     break if index == array1.size
#     new_array[index] = array1[index] * array2[index] 
#     index += 1
#   end
#   new_array
# end

def multiply_list(array1, array2)
  array1.zip(array2).map{ |array| array.inject(:*) }
end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

=begin
Problem 9: Multiply All Pairs
Input: 2 arrays 
Output: new array
Explicit:

- Write a method that takes two Array arguments in which each Array contains a list of numbers
- and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays.
- The results should be sorted by increasing value.
- You may assume that neither argument is an empty Array.

Data:
[2, 4], [4, 3, 1, 2]

2*4 8
2*3 6
2*1 2
2*2 4

4*4 16
4*3 12
4*1 4
4*2 8

Algorithm:
- Get all combinations between the two arrays
- multiply all pairs
- sort the results from smallest to largest
- return the result in an array
=end

# def multiply_all_pairs(array1, array2)
#   new_array = []
#   array1.each do |int|
#     array2.each do |int2|
#       new_array << int * int2
#     end
#   end
#   new_array.sort
# end

def multiply_all_pairs(array1, array2)
  array1.product(array2).map { |a| a.inject(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

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

LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

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

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

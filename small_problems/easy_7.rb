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

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

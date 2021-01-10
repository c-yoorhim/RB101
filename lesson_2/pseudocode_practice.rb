#problem 1: a method that returns the sum of two integers

#START

#SET method that sums two integers
def number_sum(number1, number2)
  number1 + number2
end

#PRINT method
puts number_sum(1,2)
#END

#problem 2: a method that takes an array of strings, 
#and returns a string that is all those strings concatenated together

#START
#SET new array of strings
words = %w[hi my name is yoorhim]
#WHILE iterator <= array length
  #PRINT string value
words.each {|word| print(word + " ")}
#END

#problem 3: a method that takes an array of integers, 
#and returns a new array with every other element

#SET new array of integers
numbers = [1,2,3,4,5]
#SET iterator
i = 0
#WHILE iterator <= array length
  #IF array index is odd
  #PRINT array index
while i < numbers.size
  puts numbers[i] if i.odd?
  #SET iterator + 1
  i += 1
end
#END 
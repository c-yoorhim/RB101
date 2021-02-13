=begin
Algorithm:
- validate that the inputs (num, s) are valid
	- both input are integers, => 0
	- if at least one input is invalid
		-return "Not valid"
		-stop
- create a new array
- if s = 0, return array, stop
- create a method that checks if an integer is a palindrome
	- convert integer to str
	- if reverse of str == str; then palindrome
- * check if num is a palindrome
- if num is palindrome
	- add to new array
	- increase num by 1
- if num is not palindrome
	- increase num by 1
-  repeat from* until new array size == s
- return new array
=end

def valid?(input)
  (input.to_s.to_i == input) && (input.to_i >= 0)
end

def palindrome?(num)
  num > 9 &&
  (num.to_s == num.to_s.reverse)
end

def palindrome(num, s)
  invalid = "Not valid"
  if valid?(num) && valid?(s)
    num_array = []
    return num_array if s == 0
    until num_array.size == s do
       num_array << num if palindrome?(num)
       num += 1
    end
    return num_array
  else return invalid
  end
end

p palindrome(6,4)  == [11,22,33,44]
p palindrome(75,1) == [77]
p palindrome(101,2) == [101,111]
p palindrome(20,0) == []
p palindrome(0,4) == [11,22,33,44]
p palindrome("ACCDDCCA",3) == "Not valid"
p palindrome(773,"1551") == "Not valid"
p palindrome(-4505,15) == "Not valid"
p palindrome(4505,-15) == "Not valid"

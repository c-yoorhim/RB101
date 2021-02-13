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

p palindrome(101, 5) ==  [101, 111, 121, 131, 141]
p palindrome("num", 0) == "Not valid"
p palindrome(4, 0) == []
p palindrome(2, "s") == "Not valid"
p palindrome(-1, 3) == "Not valid"

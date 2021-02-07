=begin
Input: string
Output: integer
Rules: 
-take all pos integers in str and sum
-'45' is 45, not 4 + 5

Algorithm
- create new array to store your integers
- loop through each char in the string
- check if char is integer
- if integer
  - check if the next char is a integer 
  - repeat until next char is not integer
  - store this integer in array
-if not integer
  - add deliminting char in array
- after looping through, joing array
- split str into array using deliminting char
- deal with when array is empty 
- sum the remaining integers in the array
=end

# def sum_of_integers(str)
#   integers_in_str = []
#   str.each_char do |char|
#     if char.to_i.to_s == char
#       integers_in_str << char
#     else integers_in_str << "-" 
#     end
#   end  
#   only_integers = integers_in_str.join.split("-")
#   if only_integers == []
#     0
#   else only_integers.inject {| sum, x | sum.to_i + x.to_i }
#   end
# end

# Joe's refactoring
def sum_of_integers(str)
  integers_in_str = []
	str.each_char do |char|
		integers_in_str << ((char.to_i.to_s == char) ? char : "-")
	end 
	integers_in_str.join.split("-").map(&:to_i).sum
end

p sum_of_integers('h3110 w0r1d') == 3111
p sum_of_integers('no integers') == 0
p sum_of_integers('s0m3m0r31nt3g3rs') == 40 
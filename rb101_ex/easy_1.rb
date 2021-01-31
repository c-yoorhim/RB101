=begin
input: two arguments (string, positive integer)
output:string 

rule: 
explicitas: print string as many times as the integer indicates
=end

# using a loop
# def repeat(str, num)
#   counter = 0
#   loop do
#     break if counter == num
#     puts str
#     counter += 1 
#   end
# end

#easier way
def repeat(str, num)
  num.times{ puts str }
end

#repeat('Hello', 3)#
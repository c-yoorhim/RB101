# what if i didn't know there was string#reverse

# input: string
# output: string new

# for reversing a string
#   initiate new string 
#   initiate index_start  
#   start with index -1 and add to new string
#   continue until you read -[string length - 1]
#end

def reverse_str(string)
  reverse_string = ""
  index_start = -1
  while index_start >= (-string.length)
    reverse_string << string[index_start]
    index_start += -1
  end
  reverse_string
end 

p reverse_str("hello")qw\ kp\\n0

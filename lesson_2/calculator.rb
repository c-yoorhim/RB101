#add => infront of every prompt

def prompt(message)
  Kernel.puts("=> #{message}")
end

#asks for two numbers; convert to integer
#loop for valid number
def valid_number?(num)
  num.to_i != 0
#loop for calculating again

Kernel.puts("Provide first number.")
first_num = Kernel.gets().chomp().to_i()
Kernel.puts("Provide second number.")
second_num = Kernel.gets().chomp().to_i()

loop do 
  
  #asks for the type of operation to perform: add, subtract, multiply or divide
  Kernel.puts("Provide type of operation to perform: add, subtract, multiply or divide.")
  operation = Kernel.gets().chomp()

  #displays the result
  case operation
  when "add"
    Kernel.puts(first_num + second_num)
    break
  when "subtract"
    Kernel.puts(first_num - second_num)
    break
  when "multiply"
    Kernel.puts(first_num*second_num)
    break
#float?
  when "divide"
    if second_num == 0
      Kernel.puts("You cannot divide by 0.")
      break
    else
      Kernel.puts(first_num/second_num)
      break
    end
  else Kernel.puts("Please provide a proper type of operation.")
  end

end
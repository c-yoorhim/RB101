=begin
PRINT GREETING
GET the loan amount (integer or float?)
  validate number?
GET the Annual Percentage Rate (APR), in percentage
  validate number?
  SET monthly interest rate = APR/12
GET the loan duration, months
  validate number?
  confirm?

PRINT monthly payment
GET calculate again or exit

m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months
=end

#method for all prompts
def prompt(message)
  Kernel.puts("=>#{message}")
end

#PRINT GREETING and GET name
prompt("What is your name?")
user_name = Kernel.gets().chomp()

#1st loop here
loop do
  prompt("Hello, #{user_name.capitalize()}. Would you like to calculate your monthly mortgage payment? [y/n]")
  response = Kernel.gets().chomp().downcase()

  if response.start_with?("y") #do rest
    puts "working." 
=begin    
      #validate number for all input
        def valid_number?(input)
          input.to_i.to_s == input || input.to_f.to_s == input
        end
      #GET the loan amount loop 
      loop do
      Kernel.puts("=>What is your loan amount?")
      loan_amount = Kernel.gets().chomp

    #If valid number, GET the Annual Percentage Rate (APR), in percentage
    if valid_number?(loan_amount)
      Kernel.puts("=>What's your APR for the loan amount?") 
    else 
=end  
  else break #break out of first loop
  end
end #end first loop

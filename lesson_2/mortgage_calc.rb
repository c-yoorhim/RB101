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

=end

#method for all prompts
def prompt(message)
  Kernel.puts("=>#{message}")
end

#PRINT GREETING and GET name
prompt("Hi, there. What is your name?")
user_name = Kernel.gets().chomp()

# 1st loop here
loop do
  prompt("#{user_name.capitalize()}, Would you like to calculate your monthly mortgage payment? [y/n]")
  response = Kernel.gets().chomp().downcase()

  if response.start_with?("y") #do rest
    #validate number for all input
    def valid_number?(input)
      input.to_i.to_s == input || input.to_f.to_s == input
    end

    loan_amount_input = ''
    # GET the loan amount loop 
    loop do
      prompt("What is your loan amount?")
      loan_amount_input = Kernel.gets().chomp

      # If valid number, break
      if valid_number?(loan_amount_input)
        break
      else prompt("That is not a valid loan amount.")
      end
    end # end loan amount loop

    apr_percentage_input =''
    # GET the Annual Percentage Rate (APR), in percentage loop
    loop do
      prompt("What's your APR for the loan amount (in percentage)?")
      apr_percentage_input = Kernel.gets().chomp
      
      # If valid number, confirm, break
      if valid_number?(apr_percentage_input)
        prompt("Is your APR: #{apr_percentage_input}%? [y/n]")
        # If y, break else loop
        apr_confirm = Kernel.gets().chomp().downcase()
        if apr_confirm.start_with?("y") #do rest   
          break
        else prompt("Please make sure that you are providing the APR in percentage format.")
        end  
      else prompt("That is not a valid APR.")
      end
    end # end apr loop
    
    loan_duration_input = ''
    loan_duration_months = ''
    # GET the loan duration loop 
    loop do
      prompt("What is your loan duration in months?")
      loan_duration_input = Kernel.gets().chomp
      loan_duration_months = loan_duration_input.to_f
      loan_duration_years = loan_duration_months/12 

      # If valid number, confirm, break
      if valid_number?(loan_duration_input)
        prompt("Is your loan duration #{loan_duration_input} months or #{loan_duration_years.to_i} year(s)? [y/n]")
        # If y, break else loop
        duration_confirm = Kernel.gets().chomp().downcase()
        if duration_confirm.start_with?("y") #do rest   
          break
        else prompt("Please make sure that you are providing the loan duration in months.")
        end  
      else prompt("That is not a valid loan duration.")
      end
    end # end loan duration loop
  
    # calculate monthly mortgage payment
    loan_amount = loan_amount_input.to_f
    monthly_rate = (apr_percentage_input.to_f/100)/12
    (loan_duration_months*-1)
    
    monthly_payment = (loan_amount * monthly_rate) / ( 1 - ( 1 + monthly_rate )**(-loan_duration_months))

    result = <<-MSG
    Loan amount: $#{loan_amount}
    Annual Percentage Rate: #{apr_percentage_input.to_f}%
    Loan Duration: #{loan_duration_months.to_i} months
    Monthly mortgage payment: $#{monthly_payment}
    MSG

    Kernel.puts(result)

  else break # break out of app loop
  end

end # end first loop

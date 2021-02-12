=begin
Problem 1: How old is Teddy
Explicit: 

Build a program that randomly generates and prints Teddy's age. 
To get the age, you should generate a random number between 20 and 200.

Example:
Teddy is 69 years old!

Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.
=end

def print_age(name = "Teddy")
  age = rand(20..200)
  puts "#{name} is #{age} years old!"
end

# print_age
# print_age("Sam")

=begin 
Problem 2: How big is the room?
Explicit:
- asks a user for the length and width of a room in meters
- displays the area of the room in both square meters and square feet.
- 1 square meter == 10.7639 square feet
- Do not worry about validating the input at this time.
example:
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
=end

def room_size
  puts "Enter the length of the room in meters:"
  length_m = gets.chomp.to_i
  puts "Enter the width of the room in meters:"
  width_m = gets.chomp.to_i
  area_m = length_m * width_m
  area_ft = area_m * 10.7639

  puts "The area of the room is #{area_m} square meters (#{area_ft.ceil(2)} square feet)."
end

# room_size

=begin 
Problem 3: Tip Calculator
Explicit:
- prompt for a bill amount and a tip rate. 
- compute the tip
- display both the tip and the total amount of the bill.

Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

=end

def calc_tip
  print "What is the bill? "
  bill = gets.chomp.to_f

  print "What is the tip percentage? "
  percentage = gets.chomp.to_f/100

  tip = bill * percentage

  puts "The tip is $#{tip.round(2)}."
  puts "The total is $#{(bill + tip).round(2)}."
end

#calc_tip

=begin
Problem 4: When will I Retire?
Explicit:
- displays when the user will retire
- displays how many years she has to work till retirement

Example 
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

def retirement_calc
  print "What is your age? "
  age = gets.chomp.to_i
  print "At what age would you like to retire? "
  retire_age = gets.chomp.to_i

  require 'date'
  current_year = Date.today.year
  years_to_retirement = retire_age - age  
  retire_year = current_year + years_to_retirement 
  
  puts "It's #{Date.today.year}. You will retire in #{retire_year}."
  puts "You have only #{years_to_retirement} years of work to go!"
end

# retirement_calc
=begin
Problem 5: Greeting a user
Explicit: 
- ask for user's name
- greet the user
- If the user writes "name!" then the computer yells back to the user.

Example: 
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
=end

def greeting
  print "What is your name? "
  name = gets.chomp
  name_arr = name.chars
  last_char = name_arr.last

  if last_char == "!"
    just_name = name_arr.reject { |char| char == "!"}.join
    print "HELLO #{just_name.upcase}. WHY ARE WE SCREAMING?"
  elsif
    print "Hello #{name}."
  end
end

# greeting

=begin
Problem 6: Odd Numbers; Even Numbers
Explicit: 
- Print all odd/even numbers from 1 to 99, inclusive, to the console
- Each number on a separate line.
=end

#(1..99).each { |n| puts n if n.odd? }
#(1..99).each { |n| puts n if n.even? }

=begin
Problem 8: Sum or Product of Consecutive Integers 
Explicit: 
- asks the user to enter an integer greater than 0
- then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Example: 
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

Algorithm:
- Add a prompt format
- Prompt for a int
- Get int
- Verify it is an integer; ifnot, ask again
- Prompt for action
- Get action
- Verify action;if not ask again
- Do the math
- print answer

=end

def prompt(str)
  puts ">> #{str}"
end

def integer?(str)
  if str.to_i.to_s == str
    true
  end
end

def sum_product?(str)
  if str == "s"
    true
  elsif str == "p"
    true
  end
end

def sum_or_product
  loop do 
    prompt("Please enter an integer greater than 0:")
    
    loop do
      user_int = gets.chomp

      if integer?(user_int)
        loop do 
          prompt("Enter 's' to compute the sum, 'p' to compute the product.")
          user_action = gets.chomp

          if sum_product?(user_action)
            int = user_int.to_i
            case user_action
            when "s"
              prompt("The sum of the integers between 1 and #{user_int} is #{(0..int).sum}")
            when "p"
              product = (1..int).inject(:*)
              prompt("The product of the integers between 1 and #{user_int} is #{product}.")
              break
            end
          else
            prompt("Not a valid entry.")
            break
          end
          break
        end

      else 
        prompt("Not a valid entry.")
        break
      end
      break
    end

    prompt("Would you like to start over? y/n")
    user_answer = gets.chomp
    break if user_answer == "n"
  end
end

#sum_or_product
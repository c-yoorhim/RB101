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

retirement_calc
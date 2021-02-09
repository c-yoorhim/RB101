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

room_size
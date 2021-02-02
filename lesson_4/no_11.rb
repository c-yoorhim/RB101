
=begin
Problem 1
Input: array
Output: hash
Explicit rules: 
-Turn this array into a hash
  -the names are the keys
  -values are the positions in the array
Questions:
-Do the keys need to be the same data type as the array? Assumed yes
  Data:
{
  "Fred" => 0,
  "Barney" => 1,
  "Wilma" => 2,
  "Betty" => 3,
  "Pebbles" => 4,
  "BamBam" => 5
}

Algorithm:
- Create a new hash
- Create a counter at 0
- Loop through each element in the array
- Break loop when counter == size of array - 1
- For each element, push into hash as key and push counter value as value
- Increase counter
- return new hash
=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def make_hash (array)
  new_hash = {}
  array.each { |name| new_hash[name] = array.index(name) }
  # counter = 0
  
  # loop do
  #   break if counter == array.size - 1
  #   new_hash[array[counter]] = counter
  #   counter += 1 
  # end
  
  new_hash
end

make_hash(flintstones)

=begin
Problem 2
Input: hash
Output: Integer
Explicit: 
-Add up all of the ages from the Munster family hash
Implicit:
-Return integer
Data
32 + 30 + 5843 + 10 + 22 + 237
Algorithm
-Create a variable = 0
-loop through hash by key
-Add value to variable
-return variable
=end
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages_sum = 0
ages.each_value { |age| ages_sum += age }
ages_sum == 32 + 30 + 5843 + 10 + 22 + 237

=begin
Problem 3
Input: hash
Output: hash, same
Explicit: Remove age 100 and greater
Implicit: mutate hash

Data:
ages = { 
  "Herman" => 32, 
  "Lily" => 30, 
  "Eddie" => 10 }

Algorithm:
-loop through value
-check if value > 100
-if > 100
  -find key
  -delete key
-return hash
=end
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.each_value do |age|
#   if age > 100
#     ages.delete(ages.key(age))
#   end
# end
# ages 

ages.keep_if { |name, age| age < 100 }
ages

=begin
Problem 4
Input: hash
Output: Integer
Explicit: Pick out minimumage
Implicit: return integer

Algorithm:
-create a variable
-loop through value
-compare each value to previous value
-if value is smaller, store into variable
-return variable
-return hash
=end

min_age = ages.values.first
ages.each_value do |age|
  if age < min_age
    min_age = age
  end
end

min_age == 10

#as a one liner:
ages.values.min == 10

=begin
Problem 5
Input: hash
Output: integer
Explicit: 
-Find the first name that starts with "Be"
-find the index
Implicit: 
-return index
-result exists

Algorithm:
-loop through the array
-check if name starts with "Be"
  -does it include "be"?
-get the index of the name
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

select_name = flintstones.select { |name| name.start_with?("Be") }
name_index = flintstones.index(select_name.join)

#provided solution:
# - one step
# - no need to convert
# flintstones.index { |name| name[0, 2] == "Be" }

=begin
Problem 6
Input: hash
Output: integer
Explicit: 
- Amend flinstones array 
- New array has names all shortened to just the first three characters

Data:
%w(
  Fred => Fre
  Barney => Bar
  Wilma => Wil
  Betty => Bet
  BamBam => Bam
  Pebbles => Peb
)

Algorithm:
- loop through each element
- keep only the first 3 letters
  - convert to array
  -keep_if index <= 3
  -convert back to string

=end

#why isn't it working for index of flintstones after 2??
flintstones.map! do |name|
  new_name = name.chars.keep_if {|letter| name.chars.index(letter) <= 2}
  new_name.join
end
 p flintstones
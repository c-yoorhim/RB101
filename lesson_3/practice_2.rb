# question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")
#include? or #meber?

# question 2
munsters_description = "The Munsters are creepy in a good way."
#Convert to: "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
new_munsters_description = munsters_description.split
new_munsters_description[0] = "tHE"
new_munsters_description[1] = "mUNSTERS"
new_munsters_description.join(" ")
munsters_description.swapcase
"The munsters are creepy in a good way."
munsters_description.capitalize
"the munsters are creepy in a good way."
munsters_description.downcase
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase

# question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

# question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")
advice.match?("Dino")

# question 5, 6, 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(["Dino", "Hoppy"])
# flintstones.push("Dino").push("Hoppy")
flintstones

# question 8
advice = "Few things in life are as important as house training your pet dinosaur."
# advice.slice!(/F.*important as /)
advice.slice!(0, advice.index("house"))
advice

# question 9
statement = "The Flintstones Rock!"
statement.count("t")

# question 10
title = "Flintstone Family Members"
p title.center(40)

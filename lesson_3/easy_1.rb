# problem 3
advice = "Few things in life are as important as house training your pet dinosaur."
new_advice = advice.split
new_advice[6] = "urgent"
new_advice.join(" ")

# problem 5
(10..100).include?(42)

# problem 6
famous_words = "seven years ago..."
# 2 ways to add "Four score and" in front
puts "Four score and " + famous_words
# puts famous_words.prepend("Four score and ")
puts "Four score and " << famous_words

# problem 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

# problem 8
flintstones = { "Fred" => 0, 
                "Wilma" => 1, 
                "Barney" => 2, 
                "Betty" => 3, 
                "BamBam" => 4, 
                "Pebbles" => 5 }
p flintstones.assoc("Barney")
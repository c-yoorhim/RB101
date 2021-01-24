# question 1
line = "The Flintstones Rock!"
i = 0

line
while i < 9
  line.prepend(" ")
  i += 1
end
# 10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# question 2
"the value of 40 + 2 is #{40 + 2}"

# question 3
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# question 7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member = 42  
    family_member = "other" 
    puts family_member.object_id
  end
end

puts "outside munsters object id:"
munsters.values.each { |values| puts values.object_id }

puts "inside method value object id:"
mess_with_demographics(munsters)


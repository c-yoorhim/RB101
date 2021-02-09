=begin
Problem 1:
order this array of number strings by descending numeric value
Algorithm:
-convert to integers
-sort by largest to smallest
-convert back to string
=end

arr = ['10', '11', '9', '7', '8']
arr.map { |str_num| str_num.to_i }
     .sort { |a,b| b <=> a }
     .map { |int_num| int_num.to_s }

=begin
Problem 2:
Input: array
Output: array
Explicit: 
-order this array of hashes based on:
  - the year of publication of each book
  - from the earliest to the latest

Data: 
-array
  -hash
Algorithm:
- iterate through the array
- sort by :published
  - convert year to integer before sorting
=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by { |book| book[:published] }

# Problem 3
# Reference the letter g

arr1 = [ 'a', 
         'b',
        [ 'c', ['d', 'e', 'f', 'g'] ]
      ]

arr1[2][1][3]

arr2 = [
        {first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, 
        {third: ['g', 'h', 'i']}
       ]
arr2[1][:third][0]

arr3 = [ 
        ['abc'],
        ['def'], 
        {third: ['ghi']}
       ]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1["b"][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)

=begin 
Problem 4
Explicit: 
- For each collection objects where the value 3 occurs:
  - change 3 to 4.
=end

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4

hsh2 = {['a'] => {a: [ '1', :two, 3 ], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4

# Problem 5
# Total age of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.select { |munster, info| info["gender"] == "male" }
        .each_value { |info| total_age += info["age"] } 
total_age == (32 + 402 + 10)

# Problem 6
# print out the name, age and gender of each family member

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, info|
  # puts "#{munster} is a #{info["age"]}-year-old #{info["gender"]}."
end

# "(Name) is a (age)-year-old (male or female)."

# Problem 8
# output all the vowels using each method

hsh = { first: ['the', 'quick'], 
        second: ['brown', 'fox'], 
        third: ['jumped'], 
        fourth: ['over', 'the', 'lazy', 'dog']
      }
vowels = 'aeiou'
      hsh.each_value do |words|
  words.each do |word|
    # p word.chars.select { |char| char =~ /[aeiou]/ }
    word.chars.select { |char| vowels.include?(char) }
  end
end

=begin 
Problem 9
Input: nested array
Output: new array of same structure
Explicit: 
- return a new array of the same structure
- sub arrays should be ordered (alphabetically or numerically as appropriate)
- in descending order
=end

arr = [
        ['b', 'c', 'a'], 
        [2, 1, 3], 
        ['blue', 'black', 'green']
      ]

new_arr = arr.map do |sub_array|  
  sub_array.sort { |a,b| b <=> a } 
end

=begin 
Problem 10
Input: array of hash
Output: new array of hash
Explicit: 
- use map method
- value of each integer is incremented by 1
- without modifying the original array
=end

arr = [
        {a: 1}, 
        {b: 2, c: 3}, 
        {d: 4, e: 5, f: 6}
      ]

new_arr = arr.map do |hash|
  hash.to_a.map do |hash_array|
    hash_array.map do |pair_array|
      if pair_array.to_s.to_i == pair_array
        pair_array += 1
      else pair_array
      end
    end
  end.to_h
end

new_arr

#LS solution on my own:
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash|
  new_hash = {} 
  hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

new_arr

=begin 
Problem 11
Input: nested array
Output: new nested array
Explicit: 
- use a combination of methods, including either the select or reject method
- return a new array identical in structure to the original
- new array should containing only the integers that are multiples of 3
=end

arr = [ 
        [2], 
        [3, 5, 7], 
        [9], 
        [11, 13, 15]
      ]

new_arr = arr.map do |sub_array|
  sub_array.select { |num| num % 3 == 0 }
end

new_arr

=begin
Problem 12
Input: 
Output: hash
Explicit: 
- don't use the Array#to_h method
- return a hash 
- the key is the first item in each sub array
- the value is the second item in each sub array
=end
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

new_arr = {} 
arr.each do |sub_arr|
  new_arr[sub_arr[0]] = sub_arr[1]
end

new_arr == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

=begin
Problem 13
Input: nested array
Output: new array
Explicit: 
- return a new array containing the same sub-arrays as the original
- sub-arrays should be ordered logically:
  - by only taking into consideration the odd numbers they contain
=end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

new_arr = 
arr.sort_by do |sub_arr|
  sub_arr.select { |sub_arr|sub_arr.odd? }
end

new_arr == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

=begin
Problem 14
Input: hash
Output: array
Explicit: 
- return an array containing: 
  - the colors of the fruits
    - the colors should be capitalized
  - sizes of the vegetables
    - The sizes should be uppercase
=end

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = []
hsh.each_value do |produce_info|
  if produce_info[:type] == 'fruit'  
    new_arr << produce_info[:colors].map { |color| color.capitalize } 
  else  new_arr << produce_info[:size].upcase
  end
end


new_arr == [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

=begin
Problem 15
Input: array of hashes 
Output: new array of hashes
Explicit: 
- return an array which contains:
  - only the hashes where all the integers are even
=end

arr = [
        {a: [1, 2, 3]}, 
        {b: [2, 4, 6], c: [3, 6], d: [4]}, 
        {e: [8], f: [6, 10]}
      ]

new_arr =
arr.select do |hash|
  hash.all? do |_, int_arr|
    int_arr.all? { |int| int.even? }
  end
end

new_arr

=begin
Problem 16
Input: none
Output: string
Explicit: 
- randomly generate an UUID which consists of:
- 32 hexadecimal characters, 
- typically broken into 5 sections like this 8-4-4-4-12
- represented as a string

Example: It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Question: 
- what is a hexademical character? (0..9) & (a..f)

Algorithm:
- create an array of section sizes:
  [ 8, 4, 4, 4, 12 ]
- create an empty string
- iterate through array, for each "section" element:
  - randomly generate a hexadecimal character for each index position
  - add the char to string
  - repeat random generation, "section" value amount
  - add "-" at the end unless the section is the last index of the array of section sizes
=end

def generate_uuid
  uuid_array =  [ 8, 4, 4, 4, 12 ] 
  uuid_str = ""

  uuid_array.each_with_index do |section, i|
    section.times {
      uuid_str << [rand(0..9).to_s, %w(a b c d e f).fetch(rand(0..5))].sample
    }
    
    uuid_str << "-" unless i >= uuid_array.size - 1
  end

  uuid_str
end

p generate_uuid
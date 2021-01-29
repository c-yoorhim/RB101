produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(provided_hash)
  new_hash = {}
  provided_hash.each_key do |key|
    if provided_hash[key] == 'Fruit'
      new_hash[key] = 'Fruit'
    end
  end
  new_hash
end
#select_fruit(produce) == {"apple"=>"Fruit", "pear"=>"Fruit"}

=begin
Problem
Input: value
Output: hash
Explicit: return key-value pairs where the value is 'Fruit'
Implicit: return new hash

Algorithm
-go to the first key
-check if the value of the key is 'Fruit'
-if it's Fruit, add it to the new hash
-if it's not fruit, go to the next key
-stop when there are no more key-value pairs
=end

# mutate numbesr
def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    numbers[counter] = numbers[counter]*2
    counter += 1
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
# double_numbers(my_numbers) == [2, 8, 6, 14, 4, 12]
# my_numbers

#double numbers with odd indices
def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

double_odd_numbers(my_numbers) == [1, 8, 3, 14, 2, 12]

def multiply(numbers, multiplier)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= multiplier
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) == [3, 12, 9, 21, 6, 18]

# input: a string + specified letter (str)
# output: a new string
# rules: new string contains only the letter specified

def select_letter(given_str, given_letter)
  return_str = ''
  counter = 0

  loop do
    break if counter == given_str.size

    if given_str[counter] == given_letter
      return_str << given_str[counter]
    end

    counter += 1
  end

  return_str
end

question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') == "aaaaaaaa"
select_letter(question, 't') == "ttttt"
select_letter(question, 'z') == ""

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
p double_numbers(my_numbers) == [2, 8, 6, 14, 4, 12]
p my_numbers
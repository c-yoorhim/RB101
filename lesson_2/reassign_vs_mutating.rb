a = 1
b = 2

def test1(b)
  b = "hello"
  b
end

def test2(b)
  b
end

puts "a from outside: #{a.object_id}"
puts "a from method 1: #{test1(a).object_id}"
puts "a from method 2: #{test2(a).object_id}"


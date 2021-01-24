# question 4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 && dot_separated_words.size > 3 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return false
end
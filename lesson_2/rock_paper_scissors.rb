VALID_CHOICES = {r: "rock", p: "paper", s: "scissors", l: "lizard", sp: "spock"}

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper'|| second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissor' || second == 'rock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else prompt("It's a tie!")
  end
end

total_score = {player:0, computer: 0}

# ask user to make a choice
def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    loop do
    
      prompt("Choose one: ")
      VALID_CHOICES.each {|k,v| puts k.to_s + " for " + v + "; "}
      choice = Kernel.gets().chomp().to_sym

      if VALID_CHOICES.key?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample
  
    prompt("You chose: #{VALID_CHOICES[choice]}. Computer chose: #{computer_choice}.")
    display_results(VALID_CHOICES[choice], computer_choice)
    
    #lookup until conditional?
    if total_score.value?(5)
      prompt("Grand winner is: #{total_score.key(5).to_s}!")
      break
    else
      if win?(VALID_CHOICES[choice], computer_choice)
        total_score[:player] += 1
      else win?(computer_choice, VALID_CHOICES[choice])
        total_score[:computer] += 1
      end
      prompt("Current score:")
      total_score.each {|k,v| puts k.to_s + " " + v.to_s + "; "}
    end
  end

  prompt("Do you want to play agian?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Goodbye!")

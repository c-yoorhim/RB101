=begin
1. Initialize deck
2. Deal cards to player and dealer
  - display cards
3. Player turn: hit or stay
  -calculate total
    1. create a container for total value
    2. iterate through the hand and add the value of the cards if they are (2..10), j,q,k
    3. see if the card has ace
    4. iterate through the ace stack
      - if total + 10 <= 20, add 10, else add 1
  - prompt hit or stay
    - if hit, deal 1 card
    - display card   
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

Data:
deck = { hearts: [(2..10), 'j', 'q', 'k', 'a'],
  diamonds: [],
  clubs: [],
  spades: []
}
hands = [[suits, value],[suits,value]]

=end

require 'pry'
require 'pry-byebug'

def initialize_deck
  suits = %w(h d c s)
  values = %w(2 3 4 5 6 7 8 9 10 j q k a) 
  deck = []
  suits.each do |suit|
    values.each do |value|
      deck << [suit,value]
    end
  end
  deck
end

def deal(deck, count = 1)
  case count
  when 2
    hand = deck.sample(count)
    hand.each {|card| deck.delete(card)}
  when 1
    hand = deck.sample(count).flatten
    deck.delete(hand)
  end
  hand
end

def prompt(msg)
  puts ">> #{msg}"
end

def display_cards(player_cards, dealer_cards, plays)
  if plays == ['s', 's']
    prompt("Player cards: #{player_cards}")
    prompt("Dealer cards: #{dealer_cards}")
  else
    prompt("Player cards: #{player_cards}")
    prompt("Dealer card: #{dealer_cards[0]}")
  end
end

# this isn't working

def calculate_total(hand)
  hand_total = 0
  hand.each do |card|
    if card[1].to_i.to_s == card[1]
      hand_total += card[1].to_i
    elsif card[1] == 'j' || 
          card[1] == 'k' || 
          card[1] == 'q'
      hand_total += 10
    end
  end

  ace_cards = hand.select { |card| card.include?('a') }
  ace_count = ace_cards.flatten.count('a')
  ace_count.times do  
    if hand_total + 10 <= 20
      hand_total += 10
    else hand_total += 1
    end
  end
  hand_total
end

def bust?(cards)
  calculate_total(cards) > 21
end


def winner?(player_cards, dealer_cards)
  if bust?(player_cards)
    return "Dealer"
  elsif bust?(dealer_cards)
    return "Player"
  else 
    if calculate_total(player_cards) > calculate_total(dealer_cards)
      return "Player"
    else return "Dealer"
    end
  end
end  

deck_of_cards = initialize_deck
player_cards = deal(deck_of_cards, 2)
dealer_cards = deal(deck_of_cards, 2)

player_play = ''
dealer_play = ''
display_cards(player_cards, dealer_cards, [player_play, dealer_play])

# Player's play
loop do
  prompt("Would you like to hit or stay? h/s")
  player_play = gets.chomp
  if player_play.start_with?('h')
    player_cards << deal(deck_of_cards)
    system 'cls'
    display_cards(player_cards, dealer_cards, [player_play, dealer_play])
  elsif !player_play.start_with?('s')   
    prompt("That is an invalid play.")
  end

  break if player_play.start_with?('s') || bust?(player_cards)
end

if bust?(player_cards)
  player_play = 'b'
else player_play = 's'
end

# dealer's play
hit_count = 0
loop do 
  break if calculate_total(dealer_cards) >= 17 || player_play == 'b'
  dealer_cards << deal(deck_of_cards)
  hit_count += 1
end
prompt("Dealer hit #{hit_count} times.")

if bust?(dealer_cards)
  dealer_play = 'b'
else dealer_play = 's'
end

system 'cls'
display_cards(player_cards, dealer_cards, [player_play, dealer_play])

prompt("The winner is: #{winner?(player_cards, dealer_cards)}!")

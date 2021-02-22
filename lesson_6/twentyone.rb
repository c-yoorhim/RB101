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

GAME_TOTAL = 21

def initialize_deck
  suits = %w(h d c s)
  values = %w(2 3 4 5 6 7 8 9 10 j q k a)
  deck = []
  suits.each do |suit|
    values.each do |value|
      deck << [suit, value]
    end
  end
  deck
end

def deal(deck, count = 1)
  case count
  when 2
    hand = deck.sample(count)
    hand.each { |card| deck.delete(card) }
  when 1
    hand = deck.sample(count).flatten
    deck.delete(hand)
  end
  hand
end

def prompt(msg)
  puts ">> #{msg}"
end

# rubocop:disable Style/IdenticalConditionalBranches
def display_cards(player_cards, dealer_cards, all = 0)
  if all == 1
    prompt("Player cards: #{player_cards}")
    prompt("Dealer cards: #{dealer_cards}")
  else
    prompt("Player cards: #{player_cards}")
    prompt("Dealer card: #{dealer_cards[0]}")
  end
end
# rubocop:enable Style/IdenticalConditionalBranches

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

def bust?(total)
  total > GAME_TOTAL
end

def winner?(player_total, dealer_total)
  if bust?(player_total)
    "Dealer"
  elsif bust?(dealer_total)
    "Player"
  elsif player_total < dealer_total
    "Dealer"
  elsif player_total > dealer_total
    "Player"
  else "Tie"
  end
end

loop do 
  prompt("Let's play a game of #{GAME_TOTAL}!")
  score = { player: 0, dealer: 0 }

  loop do
    prompt("Player: #{score[:player]} | Dealer: #{score[:dealer]}")
    deck_of_cards = initialize_deck
    player_cards = deal(deck_of_cards, 2)
    dealer_cards = deal(deck_of_cards, 2)
    player_total = calculate_total(player_cards)
    dealer_total = calculate_total(dealer_cards)

    display_cards(player_cards, dealer_cards)
    
    # Player's play
    loop do
      prompt("Would you like to hit or stay? h/s")
      player_play = gets.chomp.downcase
      if player_play.start_with?('h')
        player_cards << deal(deck_of_cards)
        display_cards(player_cards, dealer_cards)
      elsif !player_play.start_with?('s')
        prompt("That is an invalid play.")
      end
      player_total = calculate_total(player_cards)
      break if player_play.start_with?('s') || bust?(player_total)
    end

    # dealer's play
    hit_count = 0
    loop do
      break if dealer_total >= 17 || bust?(player_total)
      dealer_cards << deal(deck_of_cards)
      dealer_total = calculate_total(dealer_cards)
      hit_count += 1
    end
    prompt("Dealer hit #{hit_count} times.")

    system 'cls'
    display_cards(player_cards, dealer_cards, 1)
    prompt("The winner is: #{winner?(player_total, dealer_total)}!")
    
    if winner?(player_total, dealer_total) == "Player"
      score[:player] += 1
    elsif winner?(player_total, dealer_total) == "Dealer"
      score[:dealer] += 1
    end

    break if score.values.include?(5)
  end
  prompt("Grand winner is: #{score.key(5)}!")
  prompt("Would you like to play again? y/n")
  play_again = gets.chomp.downcase
  break if play_again.start_with?("n")

  prompt("Thanks for playing!")
end

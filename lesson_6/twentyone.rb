=begin
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  -calculate total
    1. create a container for total value
    2. iterate through the hand and add the value of the cards if they are (2..10), j,q,k
    3. see if the card has ace
    4. iterate through the ace stack
      - if total + 10 <= 20, add 10, else add 1
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

def calculate_total(hand)
  hand_total = 0
  hand.each do |card|
    if card[1].to_i.to_s == card[1]
      hand_total += card[1].to_i
    elsif card[1] == ('j' || 'k' || 'q')
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

# p calculate_total([['s','4'],['s','10']]) == 14
# p calculate_total([['s','j'],['s','a']]) == 20
# p calculate_total([['s','2'],['s','a'],['d', 'a']]) == 13
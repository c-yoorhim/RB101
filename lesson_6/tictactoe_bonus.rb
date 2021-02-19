=begin
Computer Defense AI
Explicit:
- if there are to be 2 squares marked by the opponent in a row, comptuer blocks
- if no immediate threat, then it will just pick a random square.
- if the computer already has 2 in a row, then fill in the 3rd square
- Create a setting at the top (i.e. a constant), so that:
  - you could play the game with either player or computer going first
  - if the constant is set to "choose" then your game will:
    - prompt the user to determine who goes first? 
    - Valid options for the constant can be "player", "computer", or "choose".

Data:
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

Algorithm for Computer AI: Defense
1. Determine if 2 of the positions in the wining lines are marked by computer
2. Determine the position to win
3. Else, determine if 2 of the positions in the winning lines are marked by player
4. Determine position to defend
5. Pick position 5 if open
5. Put marker at that position

Algorithm for Choose who goes first
1. create constant for GAME_SETTING
2. Create a case for different GAME_SETTING:
  - when "player", player goes first
  - when "coputer", computer goes first
  - when "choose", prompt user on who goes first
=end

require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = " "
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAME_SETTING = "choose" #"computer" #"player" # 
score = {"Player" => 0, "Computer" => 0}
first_turn = GAME_SETTING

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd,score_hash)
  system 'cls'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "#{joinor(score_hash.to_a[0]," :","")} | #{joinor(score_hash.to_a[1]," :","")}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter = ', ', end_word = 'or')
  str = ''
  i = 0
  until i == arr.size do
    if i < (arr.size - 1)
      str << "#{arr[i]}#{delimiter}" 
    else str << "#{end_word} #{arr[i]}"
    end
    i += 1
  end
  str   
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{ joinor(empty_square(brd))}):"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_strategy_req?(brd)
  strategy_line = []
  WINNING_LINES.each do |line|
    if (brd.values_at(*line).count(COMPUTER_MARKER) == 2) &&
       (brd.values_at(*line).count(PLAYER_MARKER) == 0)
      strategy_line = line
      return strategy_line   
    end
  end 
  
  if strategy_line == []
    WINNING_LINES.each do |line|
      if (brd.values_at(*line).count(PLAYER_MARKER) == 2) &&
         (brd.values_at(*line).count(COMPUTER_MARKER) == 0)
        strategy_line = line
        return strategy_line
      end
    end
  end

  nil
end

def computer_places_piece!(brd)
  if computer_strategy_req?(brd) == nil
    if brd[5] == INITIAL_MARKER
      square = 5
    else square = empty_square(brd).sample
    end
  else
    square = computer_strategy_req?(brd).select { |position| brd[position] == INITIAL_MARKER }.pop
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_square(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

if GAME_SETTING == "choose"
  loop do 
    prompt "Who should go first? player/computer"
    user_choice = gets.chomp.downcase
    if user_choice.start_with?("p")
      first_turn = "player"
      break
    elsif user_choice.start_with?("c")
      first_turn = "computer"
      break
    else prompt "That's not a valid player."
    end
  end
end

loop do
  loop do
    board = initialize_board

    loop do
      display_board(board, score)

      case first_turn
      when "player"
        player_places_piece!(board)
      when "computer"
        prompt "Computer will go first."
        computer_places_piece!(board)
        display_board(board, score)
      end
      break if someone_won?(board) || board_full?(board)
      
      case first_turn
      when "player"
        computer_places_piece!(board)
      when "computer"
        player_places_piece!(board)
      end 
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, score)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      score[detect_winner(board)] += 1
    else
      prompt "It's a tie!"
    end
    
    break if score.values.include?(5)
  end

  prompt "Grand winner is: #{score.key(5)}"
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"

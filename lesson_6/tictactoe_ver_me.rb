=begin
input: from user
output: winner? tie? play again?
explicit: 
- 3x3 board
- Each player takes a turn and marks a square on the board
- First player to reach 3 squares in a row, including diagonals, wins
- If all 9 squares are marked and no player has 3 squares in a row, then tie

Data:
- 3x3 board, array with hash?
[
  row 1 => %w( _ _ _)
  row 2 => %w( _ _ _)
  row 3 => %w( _ _ _)
]

Algoritm:
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
  - get positions (row, index)
  - modify display hash
3. Computer marks a square.
  - hash of computer row options
    - go through each row 
    - in each row, go through the positions
    - count how many positions are at play
    - computer options are the ones not at play
  - turn all keys with nonempty values to array for row options
  - for the chosen row, choose from array of options
  - mark comptuer's square
4. Display the updated board state.
5. If winner, display winner.
  -new method to check winner
  - win cases:
    - rows all have same mark
    - columns all have same mark
    - r1c1, r2c2, r3c3 have same mark
    - r1c3, r2c2, r3c1 have same mark
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!

=end

# my attempt:
require 'pry'
require 'byebug'

def display(row_1, row_2, row_3)
  p row_1
  p row_2
  p row_3
end

def prompt(msg)
  print ">> #{msg}:  "
end

def player_play(current_status, row, pos, mark)
  if current_status[row - 1][row][pos-1] == "_"
    current_status[row - 1][row][pos-1] = mark
  else prompt("That position is already at play.")
  end
end

def winner?(current_status, mark)
  current_status[0][1].count(mark) == 3 ||  
  current_status[1][2].count(mark) == 3 ||
  current_status[2][3].count(mark) == 3 ||
  ( (current_status[0][1][0] == mark) && (current_status[1][2][0] == mark) && (current_status[2][3][0] == mark) ) ||
  ( (current_status[0][1][1] == mark) && (current_status[1][2][1] == mark) && (current_status[2][3][1] == mark) ) ||
  ( (current_status[0][1][2] == mark) && (current_status[1][2][2] == mark) && (current_status[2][3][2] == mark) ) ||
  ( (current_status[0][1][0] == mark) && (current_status[1][2][1] == mark) && (current_status[2][3][2] == mark) ) ||
  ( (current_status[0][1][2] == mark) && (current_status[1][2][1] == mark) && (current_status[2][3][0] == mark) )    
end

def tictactoe
  loop do 
    row_1 = { 1 => %w(_ _ _) }
    row_2 = { 2 => %w(_ _ _) }
    row_3 = { 3 => %w(_ _ _) }
    prompt("Let's play Tic Tac Toe.")
    puts "" 
    display(row_1, row_2, row_3)
    
    current_play = [row_1,row_2,row_3] 
    
    total_plays = 0
    loop do
      prompt("Which row would you like to mark? (1,2 or 3)")
      user_row = gets.chomp.to_i
      prompt("Which position in the row would you like to mark? (1, 2, or 3)")
      user_pos = gets.chomp.to_i
      user_mark = "O"
      computer_mark = "X"

      # make this a method?
      player_play(current_play, user_row, user_pos, user_mark)
    
      computer_options = {}

      current_play.each do |row|
        row.each do |row_num, row_pos|
          open_positions = []
          row_pos.each_with_index do |pos, index|
            open_positions << ( index + 1 ) if pos == "_"
          end
          if open_positions.size > 0
            computer_options[row_num] = open_positions
          end
        end
      end

      computer_row = computer_options.keys.sample
      computer_pos = computer_options[computer_row].sample

      player_play(current_play, computer_row, computer_pos, computer_mark)
      display(row_1, row_2, row_3)
      
      if winner?(current_play, user_mark)
        prompt("You won!")
        puts "\n"
        break
      elsif winner?(current_play, computer_mark)
        prompt("Computer won!")
        puts "\n"
        break
      else total_plays += 1
      end

      if total_plays == 9
        display(row_1, row_2, row_3)
        return "It's a tie." 
        puts "\n"
        break
      end      
    end # loop for play

    prompt("Would you like to play again? y/n")
    answer = gets.chomp.downcase

    break if answer == "n"
  end # end loop for game start
end

tictactoe

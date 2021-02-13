=begin
input: get "location" from user
output: winner? tie? play again?
explicit: 
- 3x3 board
- Each player takes a turn and marks a square on the board
- First player to reach 3 squares in a row, including diagonals, wins
- If all 9 squares are marked and no player has 3 squares in a row, then tie

Data:
- 3x3 board, in nested array?
[
   %w( _ _ _)
   %w( _ _ _)
   %w( _ _ _)
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

def tictactoe
  loop do 
    row_1 = { 1 => %w(_ _ _) }
    row_2 = { 2 => %w(_ _ _) }
    row_3 = { 3 => %w(_ _ _) }
    prompt("Let's play Tic Tac Toe.")
    puts "" 
    display(row_1, row_2, row_3)
    
    current_play = [row_1,row_2,row_3] 

    loop do
      prompt("Which row would you like to mark? (1,2 or 3)")
      user_row = gets.chomp.to_i
      prompt("Which position in the row would you like to mark? (1, 2, or 3)")
      user_pos = gets.chomp.to_i

      if current_play[user_row - 1][user_row][user_pos-1] == "_"
        current_play[user_row - 1][user_row][user_pos-1] = "O"
      else prompt("That position is already at play.")
      end

      computer_options = {}

      current_play.each do |row|
        row.each do |row_num, row_pos|
          open_positions = []
          row_pos.each_with_index do |pos, index|
            open_positions << index if pos == "_"
          end
          if open_positions.size > 0
            computer_options[row_num] = open_positions
          end
        end
      end

      # - turn all keys with nonempty values to array for row options
      # - for the chosen row, choose from array of options
      # - mark comptuer's square

    end # loop for play
  end # end loop for game start
end

tictactoe
require 'pry'
class TicTacToe
  attr_reader :board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]  
  # board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]

  def display_board
   
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(number)
     input = number.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index.to_i]= token
  end

   def position_taken?(index)
    # @board[index] == " " ? false : true
    !(@board[index.to_i].nil? || @board[index.to_i] == " ")
   end
  
  def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
   board.count {|token| token == "X" || token == "O"}
  end 
  
  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end 
  
  def turn
    puts "Enter 1-9: "
    input =  gets.chomp
    index = input_to_index(input) # used input as arg but not working
    if valid_move?(index) 
      move(index, current_player)
      display_board
    else
      turn
    end 
 end
 
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
        false
    end
  end 

  def full?
    @board.include?(" ") ? false : true
  end 
   
   def draw?
     if !won? && full?
      return true
    else 
      false
    end
   end 
  
  def over?
    if won? || full? || draw?
      true
    else
      false
    end 
  end 
  
  def winner
    token = won?
    if !won?
      nil
    elsif
    @board[token[0]] =="X" #|| @board[token[0]] == "O"
      return "X"
    else
      return "O"
    end
  end
  
  def play 
    until over? 
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
   #end   
  end
end
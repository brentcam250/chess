require_relative 'pawn.rb'
require_relative 'player.rb'
require_relative 'cell.rb'

BOARD_X = 0..7
BOARD_Y = 0..7

BG_BLACK = "\e[40m   \e[0m"
BG_WHITE = "\e[47m   \e[0m"
# HIGHTLIGHT = {
#   INITIAL: "\e[44m   \e[0m",
#   BLANK: "\e[42m   \e[0m",
#   ENEMY: "\e[41m   \e[0m"
# }

class Board 
  attr_accessor :board
  def initialize()
    @board = build_board()
  end


  def build_board()
    # puts "hi im buildin"
    Array.new(8) do |index_x|
      Array.new(8) do |index_y|
        if index_x % 2 == 0
          index_y % 2 == 0 ?  Cell.new(BG_WHITE) : Cell.new(BG_BLACK)
        else
          index_y % 2 == 0 ? Cell.new(BG_BLACK) : Cell.new(BG_WHITE)
        end
      end

    end
  end

  def on_game_board?(position)
    #simple helper function to determine if the space passed in, is on the legal board
    if(BOARD_X.include?(position[0])) && (BOARD_Y.include?(position[1]))
      return true
    else
      return false
    end
  end

  def cell_contents(x, y)
    @board[x][y].piece.nil? ? "empty square" : @board[x][y].piece
    # @board[x][y].piece unless @board[x][y].piece.nil?
  end

end


test = Board.new
# puts test.cell_contents(1,0)

# x = 0 
# 8.times do 
#   puts x
#   puts test.board[x]
#   x+=1
# end

# puts BG_WHITE
# puts BG_BLACK
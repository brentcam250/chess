require_relative 'cell'




BOARD_X = 0..7
BOARD_Y = 0..7

BG_BLACK = "\e[40m   \e[0m"
BG_WHITE = "\e[44m   \e[0m"
HIGHLIGHT = {
  INITIAL: "\e[43m   \e[0m",
  BLANK: "\e[42m   \e[0m",
  ENEMY: "\e[41m   \e[0m"
}

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

  def display_board
    puts "\n"
    puts "   -----------------------------------------------"
    puts "8 |  #{@board[0][7]}  |  #{@board[1][7]}  |  #{@board[2][7]}  |  #{@board[3][7]}  |  #{@board[4][7]}  |  #{@board[5][7]}  |  #{@board[6][7]}  |  #{@board[7][7]}  |"
    puts seperator = "   -------+-------+-------+-------+-------+-------+-------+-------"
    puts "7 |  #{@board[0][6]}  |  #{@board[1][6]}  |  #{@board[2][6]}  |  #{@board[3][6]}  |  #{@board[4][6]}  |  #{@board[5][6]}  |  #{@board[6][6]}  |  #{@board[7][6]}  |"
    puts seperator
    puts "6 |  #{@board[0][5]}  |  #{@board[1][5]}  |  #{@board[2][5]}  |  #{@board[3][5]}  |  #{@board[4][5]}  |  #{@board[5][5]}  |  #{@board[6][5]}  |  #{@board[7][5]}  |"
    puts seperator
    puts "5 |  #{@board[0][4]}  |  #{@board[1][4]}  |  #{@board[2][4]}  |  #{@board[3][4]}  |  #{@board[4][4]}  |  #{@board[5][4]}  |  #{@board[6][4]}  |  #{@board[7][4]}  |"
    puts seperator
    puts "4 |  #{@board[0][3]}  |  #{@board[1][3]}  |  #{@board[2][3]}  |  #{@board[3][3]}  |  #{@board[4][3]}  |  #{@board[5][3]}  |  #{@board[6][3]}  |  #{@board[7][3]}  |"
    puts seperator
    puts "3 |  #{@board[0][2]}  |  #{@board[1][2]}  |  #{@board[2][2]}  |  #{@board[3][2]}  |  #{@board[4][2]}  |  #{@board[5][2]}  |  #{@board[6][2]}  |  #{@board[7][2]}  |"
    puts seperator
    puts "2 |  #{@board[0][1]}  |  #{@board[1][1]}  |  #{@board[2][1]}  |  #{@board[3][1]}  |  #{@board[4][1]}  |  #{@board[5][1]}  |  #{@board[6][1]}  |  #{@board[7][1]}  |"
    puts seperator
    puts "1 |  #{@board[0][0]}  |  #{@board[1][0]}  |  #{@board[2][0]}  |  #{@board[3][0]}  |  #{@board[4][0]}  |  #{@board[5][0]}  |  #{@board[6][0]}  |  #{@board[7][0]}  |"
    puts "   ----------------------------------------------------------------"
    puts "       1       2       3       4       5       6       7       8"
    puts "\n"
  end

end


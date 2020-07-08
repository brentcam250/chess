require_relative 'cell'
require_relative 'piece'
require_relative 'pawn'
require_relative 'player'


BOARD_X = 0..7
BOARD_Y = 0..7

BG_BLACK = "\e[40m   \e[0m"
BG_WHITE = "\e[44m   \e[0m"
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

  def set_pieces(colour, player)
    #method to setup the pieces in their initial positions
    if(colour == "black")
      y_pawn = 6 #y coord for pawns
      y_rook = 7
    else
      y_pawn = 1 #y coord for white pawns
      y_rook = 0 
    end
    x = 0 
    8.times do |pawn|
      #make 8 pawns all starting on y coord 6
      pawn = Pawn.new(player)
      @board[x][y_pawn].piece = pawn
      x += 1
    end
    rook1 = Rook.new(player)
    rook2 = Rook.new(player)

    @board[0][y_rook].piece = rook1
    @board[7][y_rook].piece = rook2


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

  # def rando 
  #   player = Player.new("Brent", "white")
  #   @board[0][7].piece = Pawn.new(player, [0,7])
  #     # @board[0][7].piece = "HELLO"

  # end

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
    puts "       A       B       C       D       E       F       G       H"
    puts "\n"
  end

end


test = Board.new
# puts test.cell_contents(1,0)

# puts test
test.display_board
# test.rando
player = Player.new("brent", "black")
player2 = Player.new("cam", "white")
test.set_pieces("black", player)
test.set_pieces("white", player2)


test.display_board


# x = 0 
# 8.times do 
#   puts x
#   puts test.board[x]
#   x+=1
# end

# puts BG_WHITE
# puts BG_BLACK
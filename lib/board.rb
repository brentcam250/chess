require_relative 'piece.rb'
require_relative 'pawn.rb'


BOARD_X = 0..7
BOARD_Y = 0..7

class Board 
  #this class will hold positions of every piece.
  # this can be used to serialize, save game and later load the same
  def initalize()
    @board = Array.new(8){Array.new(8)}
    @pieces = beginning_pieces()
  end

  def to_s
    #want to factor this so it nicely prints the board with all the pieces where they should be
  end

  def beginning_pieces
    player_1 = Player.new("brent", "black")
    player_2 = Player.new("tnerb", "white")

    pieces = []
    x = 0
    8.times do 
      new_piece = { Pawn.new(player_1, position = [x, 6] )}
      white_piece = { Pawn.new(player_2, position = [x, 1])}
      x += 1

      pieces << new_piece
      pieces << white_piece

    end
    #method to initalize all the pieces on the board with their positions.
    #perhaps an array of hashes to store the piece object along with their place on the board
  end

  def on_game_board?(position)
    #simple helper function to determine if the space passed in, is on the legal board
    if(BOARD_X.include?(position[0])) && (BOARD_Y.include?(position[1])))
      return true
    else
      return false
    end
  end
end

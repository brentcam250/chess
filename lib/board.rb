require_relative 'piece.rb'


BOARD_X = 0..7
BOARD_Y = 0..7

class Board 
  def initalize()
    @board = Array.new(8){Array.new(8)}
    @pieces = beginning_pieces()
  end

  def to_s
    #want to factor this so it nicely prints the board with all the pieces where they should be
  end

  def beginning_pieces
    #method to initalize all the pieces on the board with their positions.
    #perhaps an array of hashes to store the piece object along with their place on the board
  end
end

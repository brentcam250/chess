require_relative 'piece.rb'
require_relative 'player.rb'

class King < Piece
  def initialize(player)
    @piece = "king"
    @colour = player.colour
    @eligible_moves = king_moves()
    @check = false
  end

  def king_moves()
    #unless one of these puts the king in check
    return [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,-1],[-1,1]]

  end

  
  
  def to_s 
    @colour == 'black' ? output = "\u265A" : output = "\u2654"
    output = output.encode('utf-8')
    # output
  end

end
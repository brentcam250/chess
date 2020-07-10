require_relative 'piece'
require_relative 'player'

class Rook < Piece
  attr_reader :piece, :colour
  def initialize(player)
    @piece = "rook"
    @colour = player.colour
    @eligible_moves = rook_moves()
  end

  def rook_moves()
    moves = []
    i = 0
    8.times do 
      moves << [0,i]
      moves << [i,0]
      i += 1 
    end
    
    return moves

  end

  
  
  def to_s 
    @colour == 'black' ? output = " \u265C " : output = " \u2656 "
    output = output.encode('utf-8')
    # output
  end

end
require_relative 'piece.rb'
require_relative 'player.rb'

class Queen < Piece
  def initialize(player)
    @piece = "queen"
    @colour = player.colour
    @eligible_moves = queen_moves()
  end

  def queen_moves()
    
    #return [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,-1],[-1,1]]

  end

  
  
  def to_s 
    @colour == 'black' ? output = " \u2655 " : output = " \u265B "
    output = output.encode('utf-8')
    # output
  end

end
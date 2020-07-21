require_relative 'piece.rb'
require_relative 'player.rb'

class Queen < Piece
  attr_reader :directions
  def initialize(player)
    @piece = "queen"
    @colour = player.colour
    @eligible_moves = queen_moves()
    @directions = queen_directions()
  end

  def queen_directions() 
    ['north', 'south', 'east', 'west','northwest','northeast','southeast', 'southwest']
  end

  def queen_moves()
    
    moves = []
    i = 0
    8.times do 
      moves << [0,i]
      moves << [i,0]
      moves << [i,i]
      moves << [-i,i]
      moves << [i,-i]
      moves << [-i,-i]
      i += 1 
    end
    
    return moves
    #return [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,-1],[-1,1]]

  end

  
  
  def to_s 
    @colour == 'black' ? output = " \u2655 " : output = " \u265B "
    output = output.encode('utf-8')
    # output
  end

end
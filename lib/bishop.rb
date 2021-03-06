require_relative 'piece'


class Bishop < Piece
  attr_reader :directions
  def initialize(player)
    @piece = "bishop"
    @colour = player.colour
    @eligible_moves = bishop_moves()
    @directions = bishop_directions()
  end

  def bishop_directions()
    ['northwest','northeast','southeast', 'southwest']
  end

  def bishop_moves()
    moves = []
    i = 0
    8.times do 
      moves << [i,i]
      moves << [i,-i]
      moves << [-i,i]
      moves << [-i,-i]

      i += 1 
    end
    
    return moves

  end

  
  
  def to_s 
    @colour == 'black' ? output = " \u265D " : output = " \u2657 "
    output = output.encode('utf-8')
    # output
  end



end
require_relative 'piece'


class Knight < Piece
  
  def initialize(player)
    @piece = "knight"
    @colour = player.colour
    @eligible_moves = knight_moves()
  end

  def knight_moves()

   moves = [ [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2] ]

  end

  
  
  def to_s 
    @colour == 'black' ? output = " \u265E " : output = " \u2658 "
    output = output.encode('utf-8')
    # output
  end



end
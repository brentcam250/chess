require_relative 'piece'


class Knight < Piece
  
  def initialize(player)
    @piece = "knight"
    @colour = player.colour
    @eligible_moves = knight_moves()
  end

  def knight_moves()
    moves = []
    # i = 0
    # 8.times do 
    #   moves << [0,i]
    #   moves << [i,0]
    #   i += 1 
    # end
    
    return moves

  end

  
  
  def to_s 
    @colour == 'black' ? output = " \u265E " : output = " \u2658 "
    output = output.encode('utf-8')
    # output
  end



end
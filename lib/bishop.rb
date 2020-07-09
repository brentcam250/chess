require_relative 'piece'


class Bishop < Piece
  
  def initialize(player)
    @piece = "bishop"
    @colour = player.colour
    @eligible_moves = bishop_moves()
  end

  def bishop_moves()
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
    @colour == 'black' ? output = "\u265D" : output = "\u2657"
    output = output.encode('utf-8')
    # output
  end



end
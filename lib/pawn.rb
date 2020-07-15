require_relative "piece"
require_relative "player"


class Pawn < Piece
  attr_reader :eligible_moves, :piece, :colour
  attr_accessor :first_move
  def initialize(player)
    @piece = 'pawn'
    @colour = player.colour
    # @available_moves = available_moves()
    @eligible_moves = pawn_moves()
    @killable_neighbour = false
    @first_move = true
  end

  def pawn_moves()
    if @first_move == true
      if @colour == 'black'
        @first_move = false
        return [[0,-1], [0,-2]]
      else
        @first_move = false
        return [[0,1], [0,2]]
      end
    elsif (@killable_neighbour)
      #need to return the angle moves that a pawn can do when theres an adjacent piece
      puts "Halp"
      return false
    else
      if @colour == 'black'
        return [[0,-1]]
      else
        return [[0,1]]
      end
    end
  end


  def to_s 
    @colour == 'black' ? output = " \u265F " : output = " \u2659 "
    output = output.encode('utf-8')
    # output
  end
end

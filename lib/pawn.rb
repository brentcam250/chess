require_relative "piece"
require_relative "player"


class Pawn < Piece
  attr_reader :eligible_moves, :piece, :colour
  def initialize(player)
    @piece = 'pawn'
    @colour = player.colour
    # @available_moves = available_moves()
    @eligible_moves = pawn_moves()
    @killable_neighbour = false
  end

  def pawn_moves()
    if @number_of_moves == 0
      return [[0,1], [0,2]]
    elsif (@killable_neighbour)
      #need to return the angle moves that a pawn can do when theres an adjacent piece
      puts "Halp"
      return false
    else
      return [0,1]
    end
  end


  def to_s 
    @colour == 'black' ? output = " \u265F " : output = " \u2659 "
    output = output.encode('utf-8')
    # output
  end
end

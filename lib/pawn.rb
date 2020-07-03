require_relative 'piece.rb'
require_relative 'player.rb'

class Pawn < Piece
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

  # def available_moves()
  #   if(@number_of_moves == 0)
  #     #on its first move, a pawn may move 1 or 2 squares up.
  #     moves = [[0,1],[0,2]]
  #   else
  #     moves = [0,1]
  #     #moves = [[0,1],[1,1],[-1,1]
  #     #possible moves if there are killable pieces.
  #     #need to find out a way to determine if there are killable pieces
  #   end

  # end

  def to_s 
    @colour == 'black' ? output = "\u265F" : output = "\u2659"
    output = output.encode('utf-8')
    # output
  end
end

# player = Player.new('Brent', "black")

# test = Pawn.new(player)

# # puts test

# puts test.pawn_moves
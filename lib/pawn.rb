require_relative 'board'

class Piece 
  attr_accessor :position
  attr_reader :piece, :colour
  def initialize(player, position)
    @piece = ''
    @position = position
    @colour = player.colour
    @number_of_moves = 0
    @eligible_moves = []
  end


  def find_moves(starting_position = @position)
    #find all legal moves from the starting position
    x_pos = starting_position[0]
    y_pos = starting_position[1]
    output_moves = []
    @eligible_moves.each do |move|
      x_move = move[0]
      y_move = move[1]
      potential_new_space = [(x_pos + x_move), (y_pos + y_move)]
      if(on_game_board?(potential_new_space))
        output_moves.push(potential_new_space)
      end
   end
    return output_moves
  end 


end



# require './lib/piece.rb'
# require './lib/player.rb'

require_relative "piece.rb"
require_relative "player"


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

player = Player.new('Brent', "black")

test = Pawn.new(player)

# puts test

puts Pawn.superclass

puts test.pawn_moves
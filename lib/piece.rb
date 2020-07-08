require_relative 'board'

class Piece 
  attr_accessor :position, :display
  attr_reader :piece, :colour
  def initialize(player, position)
    @piece = ''
    @position = position
    @colour = player.colour
    @number_of_moves = 0
    @eligible_moves = []
    @display = ''
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

  def to_s 
    @display
  end


end


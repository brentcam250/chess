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
    puts "eligible = #{@eligible_moves}"
    @eligible_moves.each do |move|
      puts "looping moves: #{move}"
      x_move = move[0]
      y_move = move[1]
      puts "x: #{x_move}"
      puts "y: #{y_move}"

      x_new = x_pos + x_move
      y_new = y_pos + y_move
      if((0..7).include?(x_new) && (0..7).include?(y_new))
        #then its on the legal board
        potential_new_space = [x_new, y_new]
        output_moves << (potential_new_space)
        
      else
        #ignore that space its not legit
      end

   end
    puts "returning the following moves #{output_moves}"
    return output_moves
  end 

  def to_s 
    @display
  end


end


require_relative 'board'
require_relative 'player'
# require_relative 'cell'
require_relative 'piece'
require_relative 'pawn'
require_relative 'rook'
require_relative 'king'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'

# HIGHLIGHT = {
#   INITIAL: "\e[43m   \e[0m",
#   BLANK: "\e[42m   \e[0m",
#   ENEMY: "\e[41m   \e[0m"
# }

class Chess
  #main class that will run the game, uses external classes board, and piece.
  attr_accessor :board, :checkmate, :stalemate
  attr_reader :player_1, :player_2
  def initialize(test = false)
    @player_1 = make_player(1, "white", test)
    @player_2 = make_player(2, "black", test)
    @board = Board.new()
    @checkmate = false
    @stalemate = false
    set_pieces(@player_1)
    set_pieces(@player_2)


  end


  def make_player(player, colour, test)
    if test 
      return Player.new("test_player_name_#{colour}", colour)
    else
      #take input from user and make a new Player class with that info
      puts "player #{player} please type your name"
      name = gets.chomp.to_s 
      puts "welcome #{name} you'll be playing as #{colour}"
      player = Player.new(name, colour)
    end
  end

  def set_pieces(player)
    #method to setup the pieces in their initial positions
    if(player.colour == "black")
      y_pawn = 6 #y coord for pawns
      y_not_pawn = 7#y coord for all other pieces
    else
      y_pawn = 1 #y coord for white pawns
      y_not_pawn = 0 # y coord for all other pieces
    end
    x = 0 
    #pawns
    # 8.times do |pawn|
    #   #make 8 pawns all starting on y coord 6
    #   pawn = Pawn.new(player)
    #   # puts @board.board[x][y_pawn].class
    #   @board.board[x][y_pawn].piece = pawn
    #   x += 1
    # end
    #rooks
    rook1 = Rook.new(player)
    rook2 = Rook.new(player)
    @board.board[0][y_not_pawn].piece = rook1
    @board.board[7][y_not_pawn].piece = rook2
    
    #knights
    knight1 = Knight.new(player)
    knight2 = Knight.new(player)
    @board.board[1][y_not_pawn].piece = knight1
    @board.board[6][y_not_pawn].piece = knight2

    #bishops
    bishop1 = Bishop.new(player)
    bishop2 = Bishop.new(player)
    @board.board[2][y_not_pawn].piece = bishop1
    @board.board[5][y_not_pawn].piece = bishop2

    #queen
    queen = Queen.new(player)
    @board.board[3][y_not_pawn].piece = queen

    #king
    king = King.new(player)
    @board.board[4][y_not_pawn].piece = king

  end

  def select_piece(player)
    puts "to enter your move, first select a piece by typing first the x-coordinate of your target piece"
    x_coord = gets.chomp.to_i
    until (0..7).include?(x_coord)
      puts "please enter a number from 0-7 for the x-coordinate"
      x_coord = gets.chomp.to_i
    end
    puts "now enter a number from 0-7 for the y-coordinate"
    y_coord = gets.chomp.to_i
    until (0..7).include?(y_coord)
      puts "enter a number from 0-7 please"
      y_coord = gets.chomp.to_i
    end
    # #translate the coords to 0 based indexing
    # x_coord -= 1
    # y_coord -= 1

    if @board.board[x_coord][y_coord].piece.nil?
      puts "theres no piece there lets try this again."
      select_piece(player)
    elsif @board.board[x_coord][y_coord].piece.colour != player.colour
      puts "you cant move the other players pieces! try again!"
      select_piece(player)
    else
      #legit piece
      # @board.board[x_coord][y_coord].background_colour = HIGHLIGHT[:INITIAL]
      @board.board[x_coord][y_coord].highlight = HIGHLIGHT[:INITIAL]


      piece = @board.board[x_coord][y_coord].piece
      piece.position = [x_coord, y_coord]
      return piece
     
    end

    # end
      
  end

  def direction_caller(position, direction, piece, output_moves)
    x = position[0]
    y = position[1]

    case direction 
    when "west"
      walk_this_way([x-1,y], "west", piece, output_moves)
    when "east"
      walk_this_way([x+1,y], "east", piece, output_moves)
    when "north"
      walk_this_way([x,y+1], "north", piece, output_moves)
    when "south"
      walk_this_way([x,y-1], "south", piece, output_moves)
    when "northwest"
      walk_this_way([x-1, y+1], "northwest", piece, output_moves)
    when "northeast"
      walk_this_way([x+1,y+1], "northeast",piece, output_moves)
    when "southwest"
      walk_this_way([x-1,y-1], "southwest", piece, output_moves)
    when "southeast"
      walk_this_way([x+1,y-1], "southeast", piece, output_moves)
    else
      puts "Something is wrong in the move switch"
    end
    
  end

  def walk_this_way(position, direction, piece, output_moves = [])
    x = position[0]
    y = position[1]
    return output_moves unless (0..7).include?(x)
    return output_moves unless (0..7).include?(y)
    if(@board.board[x][y].piece == piece)
      #this is the first check, and the piece is checking itself.
      direction_caller(position, direction, piece, output_moves)
    elsif(@board.board[x][y].piece.nil?)
      #empty sqaure, must highlight and recurse
      puts "empty space shovelling #{x}, #{y}" 
      output_moves << [x,y]
      #remember this move as an available choice
      
      @board.board[x][y].highlight = HIGHLIGHT[:BLANK]
      #recursive call
      direction_caller(position,direction, piece, output_moves)
    elsif(@board.board[x][y].piece.colour == piece.colour)
      #friendly piece

      # output_moves.length == 0 ? (return) : (return output_moves)
      #return output_moves
      return


    else
      #enemy piece, must highlight and stop
      puts "open fire"
      # @board.board[x][y].background_colour = HIGHLIGHT[:ENEMY]
      output_moves << [x,y]
      puts "xy = #{x}, #{y}"
      puts "enemy output = #{output_moves}"
      @board.board[x][y].highlight = HIGHLIGHT[:ENEMY]

      return output_moves
    end

  end





  def highlight_moves(piece)
    #this function is only used for knight, pawn, king the "non-repeating move pieces"
    eligible_moves = []
    moves = piece.find_moves
    moves.each do |move|
      #highlight all potential squares
      x_move = move[0]
      y_move = move[1]
      #first must find if there are other pieces in the potential moves
      if(@board.board[x_move][y_move].piece.nil?)
        #then the square is empty
        # @board.board[x_move][y_move].background_colour = HIGHLIGHT[:BLANK]
        @board.board[x_move][y_move].highlight = HIGHLIGHT[:BLANK]
        puts "highlight == #{@board.board[x_move][y_move].highlight}"
        eligible_moves << [x_move, y_move]
      elsif piece.colour == @board.board[x_move][y_move].piece.colour
        puts "friendly fire!"
      elsif piece.piece == 'knight'
        #knight can hop we dont need to check the path
        eligible_moves << [x_move,y_move]
      else
        puts "full space"
        #must check to see if there are friendly pieces along the path that we are following.
        #note this is handled differently for the "repeating move" pieces
      
      end
    end
    return eligible_moves
    # moves = piece.find_moves
    # puts moves
  end


  def choose_move(moves, player)

    puts "player #{player.name} please select an ending position for the piece from the following options #{moves}"
    puts "please type the x- coordinate"
    x = gets.chomp.to_i
    puts "please type the y- coordinate"
    y = gets.chomp.to_i
    #hackey fix to the output_moves not coming back "flat" enough from the recursive method walk_this_way
    until moves.include?([x,y]) || moves[0].include?([x,y]) || moves[0][0].include?([x,y])
      puts "#{x}, #{y} is not an eligible move please try again"
      puts "please type the x- coordinate"
      x = gets.chomp.to_i
      puts "please type the y- coordinate"
      y = gets.chomp.to_i
    end
    puts "you've selected the move #{x}, #{y}"

    return [x,y]
  
  end

  def handle_turn(player)
    #this function handles a players turn instead of passing from one function to the next, it collects return values and calls the appropriate func
    piece = select_piece(player)
    # puts "piece #{piece}"
    moves = []
    case piece.piece
    when "knight"
      puts "do knight"
      # handle_knight(piece)
      moves = highlight_moves(piece)
    when "pawn"
      puts "do pawn"
      # handle_pawn(piece)
      moves = highlight_moves(piece)
    when "king"
      puts "do king"
      # handle_king(piece)
      moves = highlight_moves(piece)
    else
      #piece that has regular moves unlimited distance.
      directions = piece.directions
      directions.each do |direction|
        moves << walk_this_way(piece.position, direction, piece)
      end
    end

    #redraw board with highlighting 
    @board.display_board

    #now we have the eligible moves, time to get some input from player about their selection.
    selected = choose_move(moves, player)
    x_target = selected[0]
    y_target = selected[1]

    #remove the piece from the old position
    old_space = piece.position
    old_x = old_space[0]
    old_y = old_space[1]
    @board.board[old_x][old_y].piece = nil

    #move the piece
    @board.board[x_target][y_target].piece = piece
    piece.position = [x_target,y_target]
    puts "piece.position = #{piece.position}"
    puts "boards info #{@board.board[x_target][y_target].piece}"
    puts "board old space #{@board.board[0][1].piece}"


    #unhighlight the squares
    puts "about to unhighlight"
    @board.clear_highlights()

    #show board again to see if its working...
    puts "display again."
    @board.display_board
  end

  def game()
    i = 0
    until (@checkmate || @stalemate || i >= 30)
      @board.display_board
      puts "player: #{i % 2 == 0 ? player_1.name : player_2.name} its your turn"
      i % 2 == 0 ? handle_turn(player_1) : handle_turn(player_2)

      i += 1 
    end
  end

end


game = Chess.new(true)

game.board.display_board

game.game
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
    until (1..8).include?(x_coord)
      puts "please enter a number from 1-8 for the x-coordinate"
      x_coord = gets.chomp.to_i
    end
    puts "now enter a number from 1-8 for the y-coordinate"
    y_coord = gets.chomp.to_i
    until (1..8).include?(y_coord)
      puts "enter a number from 1-8 please"
      y_coord = gets.chomp.to_i
    end
    #translate the coords to 0 based indexing
    x_coord -= 1
    y_coord -= 1

    if @board.board[x_coord][y_coord].piece.nil?
      puts "theres no piece there lets try this again."
      select_piece(player)
    elsif @board.board[x_coord][y_coord].piece.colour != player.colour
      puts "you cant move the other players pieces! try again!"
      select_piece(player)
    else
      #legit piece
      @board.board[x_coord][y_coord].background_colour = HIGHLIGHT[:INITIAL]

      piece = @board.board[x_coord][y_coord].piece
      piece.position = [x_coord, y_coord]
      # highlight_moves(piece)
      # moves = piece.find_moves

      if(piece.piece == "knight")
        #dont do walk_this_way do a knight routine instead

      else

      end

      # walk_this_way([x_coord-1,y_coord], "west", piece)
      # walk_this_way([x_coord,y_coord-1], "south", piece)
      walk_this_way([x_coord+1,y_coord], "east", piece)
      walk_this_way([x_coord,y_coord+1], "north", piece)


      # find_path_recursive(moves, piece)
      # puts piece
      # moves = @board.board[x_coord][y_coord].piece.find_moves
      # puts moves
    end
      
  end

  def walk_this_way(position, direction, piece)
    x = position[0]
    y = position[1]

    if(@board.board[x][y].piece.nil?)
      puts "empty space"
      #empty sqaure, must highlight and recurse
      @board.board[x][y].background_colour = HIGHLIGHT[:BLANK]
      case direction 
      when "west"
        walk_this_way([x-1,y], "west", piece)
      when "east"
        walk_this_way([x+1,y], "east", piece)
      when "north"
        walk_this_way([x,y+1], "north", piece)
      when "south"
        walk_this_way([x,y-1], "south", piece)
      else
        puts "fill in the part where its an angle direction"
      end

    elsif(@board.board[x][y].piece.colour == piece.colour && piece != @board.board[x][y].piece)
      #friendly piece no highlight, but stop
      puts "friendly fire"
      return


    else
      #enemy piece, must highlight and stop
      puts "open fire"
      @board.board[x][y].background_colour = HIGHLIGHT[:ENEMY]
      return
    end

  end

  def find_path_recursive(moves, piece)
    move = moves.shift
    return if move.nil?
    puts "hello #{move}"
    puts "also hello moves #{moves}"
    x = move[0]
    y = move[1]
    unless(@board.board[x][y].piece.nil?)
      puts "made it to unless"
      if(piece.colour == @board.board[x][y].piece.colour)
        #friendly piece
        puts "friendly fire"
        return
      else
        #enemy piece still need to return because we cant move past an enemy either
        @board.board[x_coord][y_coord].background_colour = HIGHLIGHT[:ENEMY]
        return
      end
    else
      puts " i should highlight"
      #then no piece and we must recursively call function
      @board.board[x][y].background_colour = HIGHLIGHT[:BLANK]
      find_path_recursive(moves, piece)
    end 

  end

  # def find_path(piece)
  #   moves = piece.find_moves
  #   blocked_north = false
  #   blocked_south = false
  #   blocked_east = false
  #   blocked_west = false

  #   blocked_north_west = false
  #   blocked_north_east = false
  #   blocked_south_west = false
  #   blocekd_south_east = false
  #   moves.each do |move| 
  #     x_move = move[0]
  #     y_move = move[1]


  #   end
  # end

  def highlight_moves(piece)

    # puts "position = #{piece.position}"
    # moves = piece.eligible_moves
    moves = piece.find_moves
    # puts "moves = #{moves}"
    moves.each do |move|
      #highlight all potential squares
      x_move = move[0]
      y_move = move[1]
      #first must find if there are other pieces in the potential moves
      if(@board.board[x_move][y_move].piece.nil?)
        #then the square is empty
        @board.board[x_move][y_move].background_colour = HIGHLIGHT[:BLANK]
      elsif piece.colour == @board.board[x_move][y_move].piece.colour
        puts "friendly fire!"
      else
        puts "full space"
        #must check to see if there are friendly pieces along the path that we are following.
      
      end
    end
    # moves = piece.find_moves
    # puts moves
  end

  def game()
    i = 0
    until (@checkmate || @stalemate || i >= 30)
      @board.display_board
      puts "player: #{i % 2 == 0 ? player_1.name : player_2.name} its your turn"
      i % 2 == 0 ? select_piece(player_1) : select_piece(player_2)

      i += 1 
    end
  end

end


game = Chess.new(true)

game.board.display_board

game.game
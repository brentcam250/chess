require_relative 'board'
require_relative 'player'
# require_relative 'cell'
require_relative 'piece'
require_relative 'pawn'
require_relative 'rook'



class Chess
  #main class that will run the game, uses external classes board, and piece.
  attr_accessor :board
  attr_reader :player_1, :player_2
  def initialize(test = false)
    @player_1 = make_player(1, "white") unless test
    @player_2 = make_player(2, "black") unless test
    @board = Board.new()
    set_pieces(@player_1)
    set_pieces(@player_2)

  end


  def make_player(player, colour)
    #take input from user and make a new Player class with that info
    puts "player #{player} please type your name"
    name = gets.chomp.to_s 
    puts "welcome #{name} you'll be playing as #{colour}"
    player = Player.new(name, colour)
  end

  def set_pieces(player)
    #method to setup the pieces in their initial positions
    if(player.colour == "black")
      y_pawn = 6 #y coord for pawns
      y_rook = 7
    else
      y_pawn = 1 #y coord for white pawns
      y_rook = 0 
    end
    x = 0 
    8.times do |pawn|
      #make 8 pawns all starting on y coord 6
      pawn = Pawn.new(player)
      @board[x][y_pawn].piece = pawn
      x += 1
    end
    rook1 = Rook.new(player)
    rook2 = Rook.new(player)

    @board[0][y_rook].piece = rook1
    @board[7][y_rook].piece = rook2


  end

  def game()

  end

end

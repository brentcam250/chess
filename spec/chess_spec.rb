require './lib/pawn.rb'
require './lib/board.rb'
require './lib/piece.rb'
require './lib/king.rb'
require './lib/player.rb'
require './lib/rook.rb'
require './lib/chess.rb'


describe Board do
  describe "#initialize" do 
    it "actually initializes the board, aka board is not nil" do 
      test_board = Board.new()
      expect(test_board.nil?).to eql(false)
    end
    it "initializes cells with their appropriate background colour " do
      test_board = Board.new()
      expect(test_board.board[0][0].background_colour).to eql("\e[44m   \e[0m")
    end

    #this functionality was raised up to Chess class

    # it "fills a 2-d array with pieces where they belong" do
    #   board = Board.new
    #   player = Player.new("test", "black")
    #   board.set_pieces("black", player)
    #   expect(board.board[0][6].piece.piece).to eql("pawn")
    #   expect(board.board[0][7].piece.piece).to eql("rook")
    #   # pieces = board.pieces
    #   # expect(pieces)
    # end
       

  end
end

describe Pawn do
  describe "#initialize" do
    it "sets its identity to pawn" do 
      player = Player.new("Brent", "black")
      pawn = Pawn.new(player, [0,1])
      #expect off the beginning there are 2 eligible moves
      #expect(pawn.eligible_moves).length.to eql(2)
      expect(pawn.piece).to eql("pawn")
    end
    it "has the correct 2 moves to start off " do
      player = Player.new("Brent", "black")
      pawn = Pawn.new(player, [0,1])
      #expect off the beginning there are 2 eligible moves
      expect(pawn.eligible_moves).length.to eql(2)
    end

  end
end

describe Chess do 
  describe "#initialize" do 
    it "sets two Players" do
      game = Chess.new(true)
      expect(game.player_1.nil?).to eql(false)
      expect(game.player_2.nil?).to eql(false)

    end

    it "fills a 2-d array with pieces where they belong" do
      game = Chess.new(true)

      expect(game.board.board[0][6].piece.piece).to eql("pawn")
      expect(game.board.board[0][7].piece.piece).to eql("rook")
      expect(game.board.board[1][7].piece.piece).to eql("knight")
      expect(game.board.board[2][7].piece.piece).to eql("bishop")
      expect(game.board.board[3][7].piece.piece).to eql("queen")
      expect(game.board.board[4][7].piece.piece).to eql("king")

      # pieces = board.pieces
      # expect(pieces)
    end
  end
end

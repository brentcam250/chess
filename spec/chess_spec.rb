require './lib/pawn.rb'
require './lib/board.rb'
require './lib/piece.rb'
require './lib/king.rb'
require './lib/player.rb'
require './lib/rook.rb'


describe Board do
  describe "#initialize" do 
    it "actually initializes the board, aka board is not nil" do 
      test_board = Board.new
      expect(test_board.nil?).to eql(false)
    end
    it "initializes cells with their appropriate background colour " do
      test_board = Board.new
      expect(@board[0][0]).to eql("\e[47m   \e[0m")
    end
    it "fills a 2-d array with pieces where they belong" do
      board = Board.new
      expect(board.cell_contents(0,6)).to eql("pawn")
      expect(board.cell_contents(0,7)).to eql("rook")
      # pieces = board.pieces
      # expect(pieces)
    end
       

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
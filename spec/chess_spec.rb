# require './lib/calculator'

# describe Calculator do 
#   describe "#add" do
#     it "returns the sum of two numbers" do
#       calculator = Calculator.new
#       expect(calculator.add(5,2)).to eql(7)
#     end

#     it "returns the sum of more than two numbers" do
#       calculator = Calculator.new
#       expect(calculator.add(2,5,7)).to eql(14)
#     end
#   end
#   describe "#multiply" do
#     it "returns the product of two numbers" do 
#       calculator = Calculator.new
#       expect(calculator.multiply(5,2)).to eql(10)
#     end
#   end
# end


require './lib/pawn.rb'
require './lib/board.rb'
require './lib/piece.rb'
require './lib/king.rb'
require './lib/player.rb'
require './lib/rook.rb'


describe Board do
  describe "#initialize" do 
    it "fills a 2-d array with pieces where they belong" do
      board = Board.new
      expect(board.cell_contents(0,6)).to eql("pawn")
      expect(board.cell_contents(0,7)).to eql("rook")
      # pieces = board.pieces
      # expect(pieces)
    end
       

  end
end
class Cell
  attr_reader :background_colour
  attr_accessor :piece
  def initialize(background_colour, piece = nil)
    @background_colour = background_colour
    @piece = piece

  end

  def to_s 
    piece.nil? ? @background_colour : @background_colour.split.insert(1,piece.to_s).join
  end

end

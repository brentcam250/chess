class Cell
  attr_accessor :background_colour, :piece
  def initialize(background_colour, piece = nil)
    @background_colour = background_colour
    @piece = piece
    @highlight = false
  end

  def to_s 
    background = @highlight ? highlight : @background_colour
      # piece.nil? ? @highlight_colour : @highlight_colour.split.insert(1,piece.to_s).join
    piece.nil? ? background : background.split.insert(1,piece.to_s).join
      
    # piece.nil? ? @background_colour : @background_colour.split.insert(1,piece.to_s).join
  end

end

class Piece
  attr_accessor :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class NullPiece < Piece
  #include Singleton
end
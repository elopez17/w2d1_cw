require_relative "piece.rb"

class Board
  attr_accessor :rows
  def initialize()
    @rows = Array.new(8) { Array.new(8) }
    
    for i in 0...8 do
      for j in 0...8 do
        if i == 0 || i == 1 || i == 6 || i == 7
          @rows[i][j] = Piece.new()
        else
          @rows[i][j] = NullPiece.new()
        end
      end
    end
    
  end
  
  def move_piece(start_pos, end_pos)
    
  end
end
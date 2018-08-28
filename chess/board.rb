require_relative "piece.rb"

class Board
  attr_accessor :rows, :sentinel
  def initialize()
    @sentinel = nil
    @rows = Array.new(8) { Array.new(8) }
    for i in 0...8 do
      for j in 0...8 do
        if i == 0 || i == 1 || i == 6 || i == 7
          self[[i,j]] = Piece.new(:piece, @rows, [i, j])
        else
          self[[i,j]] = NullPiece.new(:nulls, @rows, [i, j])
        end
      end
    end
  end
  
  def move_piece(start_pos, end_pos)
    raise "There is no piece here"  if self[start_pos].is_a?(NullPiece)
    raise "Out of bounds" if out_of_range?(end_pos) || out_of_range?(start_pos)
    
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    self[end_pos].pos, self[start_pos].pos = end_pos, start_pos
  end
  
  def [](pos)
    row, col = pos
    @rows[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end
  
  def out_of_range?(pos)
    pos[0] < 0 || pos[0] > 7 || pos[-1] < 0 || pos[-1] > 7
  end
end
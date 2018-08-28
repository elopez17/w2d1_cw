require_relative "piece.rb"

class Board
  attr_accessor :rows, :sentinel
  def initialize()
    @sentinel = nil
    @rows = Array.new(8) { Array.new(8) }
    
    for i in 0...8 do
      for j in 0...8 do
        if i == 0 || i == 1 || i == 6 || i == 7
          @rows[i][j] = Piece.new(:something, @rows, [i, j])
        else
          @rows[i][j] = NullPiece.new(:something, @rows, [i, j])
        end
      end
    end
    
  end
  
  def move_piece(start_pos, end_pos)
    if @rows[start_pos.first][start_pos.last].is_a?(NullPiece)
      raise "There is no piece here" 
    end
    if end_pos[0] < 0 || end_pos[0] > 7 || start_pos[0]] < 0 || start_pos[0] > 7
      raise "Out of bounds"
    end
    
    temp = @rows[start_pos.first][start_pos.last]
    @rows[start_pos.first][start_pos.last] = @rows[end_pos.first][end_pos.last]
    @rows[end_pos.first][end_pos.last] = temp
    @rows[end_pos.first][end_pos.last].pos = end_pos
    @rows[start_pos.first][start_pos.last].pos = start_pos
  end
  
  def [](pos)
    row, col = pos
    @rows[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end
end
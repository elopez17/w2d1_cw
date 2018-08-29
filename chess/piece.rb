require "singleton"
class Piece
  attr_accessor :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
end

class NullPiece < Piece
  include Singleton
  
  def initialize
  end
end

module Sliders
  #access to move_dirs
  def moves?(start_pos, end_pos)
    movement = move_dirs
    abs_diff = start_pos.map.with_index { |el, i| (el - end_pos[i]).abs }
    if movement[:vertical]
      return true if abs_diff[0] == 0 ||  abs_diff[1] == 0
    end  
    if movement[:diagnal]
      return true if abs_diff[0] == abs_diff[1]
    end
    false
  end
end

module Steppies
  #access to move_diffs
  def moves?(start_pos, end_pos)
    diffs = start_pos.map.with_index { |el, i| (el - end_pos[i]).abs }
    move_diffs.include?(diffs)
  end
end

class Bishop < Piece
  include Sliders
    def initialize(color, board, pos)
      super
    end
    
    def move_dirs
      {:vertical => false, :diagnal => true}
    end
    
    def symbol
      if @color == :team1
        return "♝"
      else
        return "♗"
      end
    end
end

class Rook < Piece
  include Sliders
    def initialize(color, board, pos)
      super
    end
    
    def move_dirs
      {:vertical => true, :diagnal => false}
    end
    
    def symbol
      if @color == :team1
        return "♜"
      else
        return "♖"
      end
    end
end

class Queen < Piece
  include Sliders
    def initialize(color, board, pos)
      super
    end
    
    def move_dirs
        {:vertical => true, :diagnal => true}
    end
    
    def symbol
      if @color == :team1
        return "♛"
      else
        return "♕"
      end
    end
end

class King < Piece
  include Steppies
    def initialize(color, board, pos)
      super
    end
    
    def move_diffs
      [
        [0, 1],
        [0, -1],
        [1, 1],
        [-1, 1],
        [-1, -1],
        [1, -1],
        [1, 0],
        [-1, 0]
      ]
    end
    
    def symbol
      if @color == :team1
        return "♚"
      else
        return "♔"
      end
    end
end

class Knight < Piece
  include Steppies
    def initialize(color, board, pos)
      super
    end
    
    def move_diffs
      [
        [1, 2],
        [1, -2],
        [-2, 1],
        [2, 1],
        [-1, 2],
        [-1, -2],
        [-2, 1],
        [-2, -1]
      ]
    end
    
    def symbol
      if @color == :team1
        return "♞"
      else
        return "♘"
      end
    end
end

class Pawn < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      if @color == :team1
        return "♟"
      else
        return "♙"
      end
    end
end

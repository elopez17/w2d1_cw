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

class Bishop < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      if @color == :player1
        return "♝"
      else
        return "♗"
      end
    end
end

class Rook < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      if @color == :player1
        return "♜"
      else
        return "♖"
      end
    end
end

class Queen < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      if @color == :player1
        return "♛"
      else
        return "♕"
      end
    end
end

class King < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      if @color == :player1
        return "♚"
      else
        return "♔"
      end
    end
end

class Knight < Piece
    def initialize(color, board, pos)
      super
    end
    
    def symbol
      if @color == :player1
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
      if @color == :player1
        return "♟"
      else
        return "♙"
      end
    end
end
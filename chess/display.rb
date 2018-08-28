require_relative "cursor.rb"
require "colorize"

class Display
  attr_reader :cursor, :board
  def initialize(board, cursor)
    @board = board
    @cursor = cursor
  end
  
  def render
    system('clear')
    for j in 0...8 do
      if j.even?
        color1 = :green
        color2 = :cyan
      else
        color2 = :green
        color1 = :cyan
      end
      
      for t in 0...5 do
        for i in 0...8 do
          if @board[[i, j]].is_a?(NullPiece)
            piece = " "
          elsif t == 2
            piece = "♟"
          else
            piece = " "
          end
          # piece = " "
          if [i, j] == @cursor.cursor_pos
            print "     #{piece}    ".colorize(:color => :light_blue, :background => :red)
          elsif i.even?
            print "     #{piece}    ".colorize(:color => :light_blue, :background => color1)
          else
            print "     #{piece}    ".colorize(:color => :light_blue, :background => color2)
          end
          
        end
        print "\n"
      end
      
    end
    
  end
  
end
require_relative "cursor"

class Game
  attr_reader :board, :display 
  
  def initialize(board, display, cursor)
    @board = board
    @display = display
    @cursor = cursor 
  end
  
  def play 
    loop do
      begin
        @display.render
        start_pos = nil 
        while start_pos.nil?
          start_pos = @cursor.get_input
          @display.render
        end
        end_pos = nil
        while end_pos.nil?
          end_pos = @cursor.get_input
          @display.render
        end
        print @cursor.cursor_pos, "\n"
        @board.move_piece(start_pos, end_pos)
      rescue InvalidMoveError => e
        puts e.message
        retry
      end
      
    end
  end
  
end

if __FILE__ == $0
  b = Board.new()
  c = Cursor.new([0, 0], b)
  d = Display.new(b, c)
  g = Game.new(b, d, c)
  g.play
end
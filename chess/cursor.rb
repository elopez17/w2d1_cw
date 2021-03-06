require "io/console"
require_relative "errors.rb"
require_relative "board.rb"
require_relative "display.rb"

KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}

MOVES = {
  left: [-1, 0],
  right: [1, 0],
  up: [0, -1],
  down: [0, 1]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    begin
      key = KEYMAP[read_char]
      handle_key(key)
    rescue InvalidKeyError => e
      puts e.message
      retry
    rescue RangeError => e
      puts e.message
      retry
    end
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :return, :space
      return @cursor_pos.dup
    when :left, :right, :up, :down
      update_pos(MOVES[key])
      return nil
    when :ctrl_c
      Process.exit(0)
    when nil
      raise InvalidKeyError
    end
  end

  def update_pos(diff)
    @cursor_pos.map!.with_index { |elem, idx| elem + diff[idx] }
    if @board.out_of_range?(@cursor_pos)
      @cursor_pos.map!.with_index { |elem, idx| elem - diff[idx] }
      raise RangeError
    end
    @cursor_pos
  end
end

if __FILE__ == $0
  b = Board.new()
  c = Cursor.new([0, 0], b)
  d = Display.new(b, c)
  loop do
    c.get_input
    d.render
    print c.cursor_pos, "\n"
  end
end
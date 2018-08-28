require_relative "cursor.rb"
require "colorize"

class Display
  attr_reader :cursor, :board
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end
end
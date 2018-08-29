class InvalidKeyError < StandardError
  def initialize(msg="Invalid key, try again")
    super
  end
end

class RangeError < StandardError
  def initialize(msg="Move is out of range, try again")
    super
  end
end

class InvalidMoveError < StandardError
  def initialize(msg="Invalid move, try again")
    super
  end
end
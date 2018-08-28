class InvalidKeyError < StandardError
  def initialize(msg="Invalid key, try again")
    super
  end
end
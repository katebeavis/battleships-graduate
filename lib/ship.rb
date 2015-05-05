
class Ship
  DEFAULT_LENGTH = 1
  MAX_LENGTH = 3

  attr_reader :length

  def initialize(length = DEFAULT_LENGTH)
    fail 'Too big' if length > MAX_LENGTH
    @length = length
  end
end

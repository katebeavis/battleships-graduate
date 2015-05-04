class Board
  attr_reader :grid

  def initialize
    @grid = { A1: '' }
  end

  def place_ship(ship, coordinate)
    grid[coordinate] = ship
  end
end

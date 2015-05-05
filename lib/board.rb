class Board
  attr_reader :grid

  def initialize
    @grid = { A1: '' }
  end

  def place_ship(ship, coordinate, orientation = :horizontally)
    fail 'Ship is too big to be placed' if ship.length > grid.length
    fail 'You must place the ship on the grid' unless grid.keys.include?(coordinate)
    fail 'There is already a ship here' if grid.values.include?(ship)
    grid[coordinate] = ship
  end
end

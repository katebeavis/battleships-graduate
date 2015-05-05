class Board
  attr_reader :grid

  def initialize
    @grid = { A1: :water }
  end

  def place_ship(ship, coordinate, orientation = :horizontally)
    fail 'Ship is too big to be placed' if ship.length > grid.length
    fail 'You must place the ship on the grid' unless grid.keys.include?(coordinate)
    fail 'There is already a ship here' if grid.values.include?(:ship)
    grid[coordinate] = :ship
  end

  def fire(coordinate)
    if miss?
      grid[coordinate] = :miss
    elsif hit?
      grid[coordinate] = :hit
    elsif been_missed? || been_hit?
      fail 'This has already been fired at'
    end
  end

  private

  def miss?
    grid.values.include?(:water)
  end

  def hit?
    grid.values.include?(:ship)
  end

  def been_missed?
    grid.values.include? :miss
  end

  def been_hit?
    grid.values.include? :hit
  end
end

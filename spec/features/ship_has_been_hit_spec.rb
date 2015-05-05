require 'spec_helper'

feature 'As a player, I would like to know when my ship has been hit' do
  let(:board) { Board.new }
  let(:ship) { Ship.new }
  scenario 'Ship registers a hit' do
    board.place_ship(ship, :A1)
  end
end

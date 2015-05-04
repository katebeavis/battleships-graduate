require 'spec_helper'
require 'board'

feature 'As a player, I want to prepare for a game by placing ships' do
  let(:board) { Board.new }
  let(:ship) { double :ship }
  scenario 'Player places ship on board' do
    board.place_ship(ship, :A1)
    expect(board.grid[:A1]).to eq(ship)
  end
end

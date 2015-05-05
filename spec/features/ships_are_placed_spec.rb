require 'spec_helper'

feature 'As a player, I want to prepare for a game by placing ships' do
  let(:board) { Board.new }
  let(:ship) { double :ship, length: 1 }
  scenario 'Player places ship on board' do
    board.place_ship(ship, :A1)
    expect(board.grid[:A1]).to eq(:ship)
  end

  scenario 'Player can\'t place a ship where there is already one there' do
    board.place_ship(ship, :A1)
    expect { board.place_ship(ship, :A1) }.to raise_error 'There is already a ship here'
  end
end

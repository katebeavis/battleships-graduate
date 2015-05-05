require 'spec_helper'

feature 'As an aggressive player, I would like to shoot at ships' do
  let(:board) { Board.new }
  let(:ship) { double :ship, length: 1 }
  scenario 'Player can fire at empty cells and get a miss' do
    board.fire(:A1)
    expect(board.grid[:A1]).to eq(:miss)
  end

  scenario 'Player can fire at a cell with a ship and get a hit' do
    board.place_ship(ship, :A1)
    board.fire(:A1)
    expect(board.grid[:A1]).to eq(:hit)
  end

  scenario 'Player can\'t fire at a cell that has a miss' do
    board.fire(:A1)
    expect { board.fire(:A1) }.to raise_error 'This has already been fired at'
  end

  scenario 'Player can\'t fire at a cell that has a miss' do
    board.place_ship(ship, :A1)
    board.fire(:A1)
    expect { board.fire(:A1) }.to raise_error 'This has already been fired at'
  end
end

require 'spec_helper'
require 'board'

describe Board do
  it { is_expected.to respond_to(:grid) }

  it 'has a grid with an A1 cell' do
    expect(subject.grid).to include(:A1)
  end

  it 'has empty cells before ships are placed' do
    expect(subject.grid[:A1]).to eq('')
  end

  describe 'placing ships' do

    let(:ship) { double :ship }

    it 'a ship can be placed on the board' do
      subject.place_ship(ship, :A1)
      expect(subject.grid[:A1]).to eq(ship)
    end
  end
end

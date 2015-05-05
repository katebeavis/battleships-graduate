require 'spec_helper'

describe Board do
  it { is_expected.to respond_to(:grid) }

  it 'has a grid with an A1 cell' do
    expect(subject.grid).to include(:A1)
  end

  it 'has empty cells before ships are placed' do
    expect(subject.grid[:A1]).to eq(:water)
  end

  it 'has a length of 1' do
    expect(subject.grid.length).to eq(1)
  end

  describe 'placing ships' do
    let(:ship) { double :ship, length: 1 }

    it 'lets a ship be placed on the board' do
      subject.place_ship(ship, :A1)
      expect(subject.grid[:A1]).to eq(:ship)
    end

    it 'doesn\'t let ships be placed on cells that don\'t exist' do
      expect { subject.place_ship(ship, :B1) }.to raise_error 'You must place the ship on the grid'
    end

    it 'doesn\'t let ships be place if there is already a ship there' do
      subject.place_ship(ship, :A1)
      expect { subject.place_ship(ship, :A1) }.to raise_error 'There is already a ship here'
    end
  end

  describe 'placing ships that are bigger than 1 cell' do
    let(:ship) { double :ship, length: 2 }
    it 'doesn\'t let a ship be placed that is too big' do
      expect { subject.place_ship(ship, :A1) }.to raise_error 'Ship is too big to be placed'
    end
  end

  describe 'firing shots' do
    let(:ship) { double :ship, length: 1 }
    it 'has the ability to fire shots at an empty cell and get a miss' do
      subject.fire(:A1)
      expect(subject.grid[:A1]).to eq(:miss)
    end

    it 'has the ability to fire shots at cell with a ship and get a miss' do
      subject.place_ship(ship, :A1)
      subject.fire(:A1)
      expect(subject.grid[:A1]).to eq(:hit)
    end

    it 'doesn\'t let the same cell be fired at after a miss' do
      subject.fire(:A1)
      expect { subject.fire(:A1) }.to raise_error 'This has already been fired at'
    end

    it 'doesn\'t let the same cell be fired at after a hit' do
      subject.place_ship(ship, :A1)
      subject.fire(:A1)
      expect { subject.fire(:A1) }.to raise_error 'This has already been fired at'
    end
  end
end

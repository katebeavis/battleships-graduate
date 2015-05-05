require 'spec_helper'
require 'ship'

describe Ship do
  let(:ship) { described_class.new }
  it 'is created with a default size of 1' do
    expect(subject.length).to eq(1)
  end

  it 'is able to be different sizes' do
    ship = described_class.new(2)
    expect(ship.length).to eq(2)
  end

  it 'has a maximum length' do
    expect { described_class.new(5) }.to raise_error 'Too big'
  end
end

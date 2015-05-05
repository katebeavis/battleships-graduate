require 'spec_helper'
require 'ship'

feature 'As a player, I want to have ships with different lengths' do
  scenario 'Player chooses ships with different lengths' do
    ship = Ship.new(2)
    expect(ship.length).to eq(2)
  end
end

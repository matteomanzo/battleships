require 'player'

describe Player do

  let(:player){Player.new}
  let(:ship){double :ship}
  let(:board){double :board}
  
  it 'should be able to place a ship' do
    expect{player.place_ship(ship, :c5)}.to 
end
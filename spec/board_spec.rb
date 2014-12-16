require 'board'

describe Board do

let(:board){Board.new}
let(:ship){double :ship}

  it 'should start with the value of water' do
    expect(board.grid[:a1]).to eq(:water)
  end

  it 'will know that a cell contains a ship when a ship is placed' do
    expect{board.place(ship, :b4)}.to change{board.grid[:b4]}.to (ship)
  end

  it 'will know if a player\'s shot hits a ship' do
    expect{player.shoot!(:b4)}.to change{board.hit?(:b4)}.to (true)
  end

  
end
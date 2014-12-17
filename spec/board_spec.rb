require 'board'
require 'ship'
describe Board do

let(:board){Board.new}
let(:ship){double :ship, is_a?: Ship}

  it 'should start with the value of water' do
    expect(board.grid[:a1]).to eq(:water)
  end

  it 'will know that a cell contains a ship when a ship is placed' do
    expect{board.place(ship, :b4)}.to change{board.grid[:b4]}.to (ship)
  end

  it 'will know if a player\'s shot hits a ship' do
    board.place(ship, :b4)
    allow(ship).to receive(:hit!)
    expect{board.receive_shot(:b4)}.to change{board.grid[:b4]}.to (:hit)

  end

  it 'should know if a player misses a shot' do
    expect{board.receive_shot(:c5)}.to change{board.grid[:c5]}.to (:miss)
  end
  
end
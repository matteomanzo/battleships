require 'board'
require 'ship'
describe Board do

let(:board){Board.new}
let(:ship){Ship.new(3)}

  it 'should start with the value of water' do
    expect(board.grid[:a1]).to eq(:water)
  end

  it 'will know that a cell contains a ship when a ship is placed' do
    expect{board.place(ship, :b4)}.to change{board.grid[:b4]}.to (ship)
  end

  it 'will know if a player\'s shot hits a ship' do
    board.place(ship, :b4)
    puts board.grid[:b4].inspect
    expect{board.hit(:b4)}.to change{board.grid[:b4]}.to (:hit)

  end

  it 'should know if a player misses a shot' do
    expect{board.hit(:c5)}.to change{board.grid[:c5]}.to (:miss)
  end
  
end
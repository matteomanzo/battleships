require 'board'
require 'ship'
describe Board do

let(:board){Board.new}
let(:ship){double :ship, is_a?: Ship}

  it 'should start with the value of water' do
    expect(board.grid[:a1]).to eq(:water)
  end

  it 'will know that a cell contains a ship when a ship is placed' do
    expect{board.new_cell_assignment(:b4, ship)}.to change{board.grid[:b4]}.to (ship)
  end

  it 'will know if a player\'s shot hits a ship' do
    board.new_cell_assignment(:b4, ship)
    allow(ship).to receive(:hit!)
    expect{board.receive_shot(:b4)}.to change{board.grid[:b4]}.to (:hit)

  end

  it 'should know if a player misses a shot' do
    expect{board.receive_shot(:c5)}.to change{board.grid[:c5]}.to (:miss)
  end

  it 'should raise an error if trying to hit a cell twice' do
    board.new_cell_assignment(:c5, :hit)
    expect(lambda { board.receive_shot(:c5) }).to raise_error(RuntimeError, 'You cannot hit the same cell twice!')
  end
  
end
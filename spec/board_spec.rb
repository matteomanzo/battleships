require 'board'
require 'ship'
describe Board do

let(:board){Board.new}
let(:ship){double :ship, is_a?: Ship}
let(:battleship){double :ship, is_a?: Ship}
let(:submarine) {double :submarine, is_a?: Ship}

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

  it 'should not accept a ship into the same cell twice' do
    board.new_cell_assignment(:c5, ship)
    expect{board.new_cell_assignment(:c5, battleship)}.to raise_error(RuntimeError, "There is already a ship in this cell")
  end

  it 'should be able to place ships longer than one cell size' do
    expect{board.new_cell_assignment(:c2, :d2, :e2, submarine)}.to change{board_grid[:c2, :d2, :e2]}.to (submarine)
  end
  
end
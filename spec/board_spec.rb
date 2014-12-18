require 'board'
require 'ship'
describe Board do

let(:board){Board.new}
let(:ship){double :ship, is_a?: Ship, size: 3}
let(:battleship){double :ship, is_a?: Ship}
let(:submarine) {double :ship, is_a?: Ship, size: 5}

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

  it 'should be able to place ships longer than one cell horizontally' do
    expect{board.place_ship(:f3, ship, "horizontal")}.to change{board.grid[:f5]}.to (ship)
  end
  
  it 'should be able to place ships longer than one cell vertically' do
    expect{board.place_ship(:f3, submarine, "vertical")}.to change{board.grid[:j3]}.to (submarine)
  end

  it 'should be able to get all coordiantes for a ship' do
    expect(board.get_all_cells_for(:a1, ship, "horizontal")).to eq [:a1,:a2,:a3]
  end

  it 'should be able to get all coordiantes for a ship vertically' do
    expect(board.get_all_cells_for(:a1, ship, "vertical")).to eq [:a1,:b1,:c1]
  end

  it 'should not place any part of a ship if another is in its way' do
    board.new_cell_assignment(:b5, ship)
    expect{board.place_ship(:a5, ship, "vertical")}.to raise_error(RuntimeError, "There is already a ship in this location!")
  end

  it 'should not place any part of a ship that goes out of the grid' do
    expect{board.place_ship(:a9, ship, "horizontal")}.to raise_error(RuntimeError, "There is not enough space for your ship in this location")
  end
end
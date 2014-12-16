require 'board'

describe Board do

let(:board){Board.new}
let(:ship){double :ship}

  it 'should start with the value of water' do
    expect(board.grid[:a1]).to eq(:water)
  end

  it 'should change the value to :ship when a ship has placed' do
    expect{board.place(ship)}.to change{board.grid[:b4]}.to (:ship)
  end
  
end
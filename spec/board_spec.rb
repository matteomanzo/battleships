require 'board'

describe Board do

let(:board){Board.new}
let(:ship){double :ship}

  it 'should start with the value of empty' do
    expect(board.grid["a1"]).to eq(:empty)
  end
  
end
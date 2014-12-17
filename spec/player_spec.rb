require 'player'


describe Player do

  let(:ship){double :ship}
  let(:board){double :board }
  let(:player){Player.new('name', board)}
  
  it 'should be able to place a ship' do
    expect(board).to receive(:new_cell_assignment).with(:c5, ship)
    player.place(:c5, ship)
  end

  it 'should be able to shoot at the board' do
    expect(board).to receive(:receive_shot).with(:c5)
    player.shoot(:c5)
  end
end
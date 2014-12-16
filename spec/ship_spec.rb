require './lib/ship.rb'

describe Ship do
 
  let(:ship){Ship.new(3)}
  let(:grid){double :grid}
  let(:player){double :player}

  it 'should start with an available status' do
    expect(ship.status).to be(:available)
  end

  it 'should be able to be placed' do
    expect{ship.positioned}.to change{ship.status}.to(:positioned)
  end

  it 'should know if it has been sunk' do
    expect{ship.sunk}.to change{ship.status}.to(:sunk)
  end

  it 'should be able to contain ships in a certain position' do
    expect{ship.placed!('a1', @horizontally)}.to change{ship.status}.to(:positioned)
  end
 
end
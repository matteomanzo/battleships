require './lib/ship.rb'

describe Ship do
 
  let(:ship){Ship.new(3)}
  let(:grid){double :grid}
  let(:player){double :player}

  it 'should know if it has been sunk' do
    expect{ship.sunk}.to change{ship.status}.to(:sunk)
  end

  it 'should have a floating status when created' do
    expect(ship.status).to eq(:floating)
  end

  it 'should count its hits' do
    expect{ship.hit!}.to change{ship.hits_count}.by (1)
  end

end
require './lib/ship.rb'

describe Ship do
 
  let(:ship){Ship.new(3)}
  let(:grid){double :grid}
  let(:player){double :player}

   it 'should have a floating status when created' do
    expect(ship.sunk?).to eq false
  end

  it 'should count its hits' do
    expect{ship.hit!}.to change{ship.hit_count}.by (1)
  end

  it 'should sink when its entire length has been hit' do
    expect{3.times{ship.hit!}}.to change{ship.sunk?}.to true
  end

  it 'should create a destroyer sized 3' do
    expect(Ship.destroyer.size).to eq 3
  end

end
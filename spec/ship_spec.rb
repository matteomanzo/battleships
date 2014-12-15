require './lib/ship.rb'

describe Ship do
 
 let(:ship){Ship.new}
 let(:grid){double :grid}
 let(:player){double :player}

 it 'should start with an available status' do
  expect(ship.status).to eq('available')
 end

end
require './lib/ship.rb'

describe Ship do
 
 let(:ship){Ship.new}
 let(:grid){double :grid}
 let(:player){double :player}

 it 'should start with an available status' do
   expect(ship.status).to eq('available')
 end

 it 'should be able to be placed' do
   expect(ship.placed!).to change{ship.status}.to("placed")
 end

end
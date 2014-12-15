require './lib/ship.rb'

describe Ship do
 
 let(:ship){Ship.new}
 let(:grid){double :grid}
 let(:player){double :player}

 it 'should start with an available status' do
   expect(ship.positioned).to eq(false)
 end

 it 'should be able to be placed' do
   expect{ship.placed!}.to change{ship.positioned}.to(true)
 end

 it 'should know if it has been sunk' do
   expect{ship.sunk!}.to change(ship.sunk?).to(true)
 end
 
end
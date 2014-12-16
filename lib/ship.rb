require_relative 'board'
require_relative 'player'

class Ship

  attr_reader :status, :size

  def initialize(size)
    @status ||= :available
    @size = size
  end

  states = [:available, :positioned, :sunk]
  states.each do |status|
    define_method status do
      @status = status
    end
  end

  def placed!(grid_ref, layout)

  end
  
end

aircraft_carrier = Ship.new(5)
battleship = Ship.new(4)
submarine = Ship.new(3)
destroyer = Ship.new(3)
patrol_boat = Ship.new(2)


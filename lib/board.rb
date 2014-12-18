require_relative 'player'
require_relative 'ship'

class Board

  attr_reader :grid

  def initialize
    @grid = {}
    ('a'..'j').each{|l| (1..10).each{|n| @grid["#{l}#{n}".to_sym] = :water}}
  end

  def receive_shot cell
    cell_content = self.grid[cell]
    raise 'You cannot hit the same cell twice!' if cell_content == :hit || cell_content == :miss
    cell_content.is_a?(Ship) ? ship_hit(cell, cell_content) : new_cell_assignment(cell, :miss)
  end

  def new_cell_assignment(cell, value)
    cell_content = self.grid[cell]
    raise "There is already a ship in this cell" if cell_content.is_a?(Ship) unless value == :hit
    self.grid[cell] = value
  end

  def ship_hit(cell, ship)
    new_cell_assignment(cell, :hit)
    ship.hit!
  end

  def place_ship(cell, ship, orientation)
  if "horizontal"
    size = ship.size
    size.times  do 
      cell = cell.to_s.next.to_sym 
      cell_content = self.grid[cell] 
        if cell_content.is_a?(Ship) 
          raise "blah" 
        else
          new_cell_assignment(cell, ship)
        end
      end
    size = ship.size
    size.times {cell = cell.to_s.next.to_sym; new_cell_assingment(cell, ship)}
  elsif "vertical"
    size.times do
      cell = cell.to_s.reverse.next.reverse.to_sym
      cell_content = self.grid[cell]
      if cell_content.is_a?(Ship) 
          raise "blah" 
        else
          new_cell_assignment(cell, ship)
        end
      end
    size.times {cell = cell.to_s.reverse.next.reverse.to_sym; new_cell_assingment(cell, ship)}
  else 
    raise "please state either a horizontal or vertical orientation"
  end  
end


end
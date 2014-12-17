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
    #raise "There is already a ship in this cell" if cell_content.is_a?(Ship) unless value == :hit
    self.grid[cell] = value
  end

  def ship_hit(cell, ship)
    new_cell_assignment(cell, :hit)
    ship.hit!
  end

  def place_ship(cell, ship, orientation)
    size = ship.size
    cell = cell.to_s
    cell_array = cell.split(//)
    l = cell_array[0]
    n = cell_array[1]
    if orientation == "horizontal"
      size.times do
        n = n.to_i
        next_n = n+1;
        new_cell = "#{@l}#{next_n}".to_sym
        new_cell_assignment(new_cell, ship)
      end
    # elsif orientation == "vertical"
    #   size.times do
    #     next_l = ??????;
    #     new_cell = next_l+n
    #     new_cell_assignment(new_cell, ship)
    #   end
    # else 
    #   raise "please state either a horizontal or vertical orientation"
    end  
  end

end
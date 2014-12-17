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
    cell_content.is_a?(Ship) ? ship_hit(cell_content, cell) : new_cell_assignment(cell, :miss)
  end

  def new_cell_assignment(cell, value)
    self.grid[cell] = value
  end

  def ship_hit(ship, cell)
    new_cell_assignment(cell, :hit)
    ship.hit!
  end

end
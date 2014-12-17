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
    raise 'You cannot hit the same cell twice!' if cell_content == :hit || :miss 
    cell_content.is_a?(Ship) ? ship_hit(cell, cell_content) : new_cell_assignment(cell, :miss)
  end

  def new_cell_assignment(cell, value)
    self.grid[cell] = value
  end

  def ship_hit(cell, ship)
    new_cell_assignment(cell, :hit)
    ship.hit!
  end

end
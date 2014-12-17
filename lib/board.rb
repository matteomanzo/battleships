require_relative 'player'
require_relative 'ship'

class Board

  attr_reader :grid

  def initialize
    @grid = {}
    ('a'..'j').each{|l| (1..10).each{|n| @grid["#{l}#{n}".to_sym] = :water}}
  end

  def place ship, cell
    self.grid[cell] = ship
  end

  def hit cell
    grid_content = self.grid[cell]
    if grid_content.is_a?(Ship)
      self.grid[cell] = :hit
    else
      self.grid[cell] = :miss
    end
  end

end

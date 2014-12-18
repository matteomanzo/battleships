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
    self.grid[cell] = value
  end

  def ship_hit(cell, ship)
    new_cell_assignment(cell, :hit)
    ship.hit!
  end

  def place_ship(cell, ship, orientation)
    cells =  get_all_cells_for(cell, ship, orientation)
    raise "There is already a ship in this location!" if cells.any?{|cell| grid[cell].is_a? Ship}
    raise "There is not enough space for your ship in this location" if outside_grid?(cell, ship, orientation)
    cells.each {|cell| grid[cell] = ship}
  end

  def get_all_cells_for cell, ship, orientation
    cells = [cell]
    (ship.size - 1).times do 
      cells << next_cell(cells.last, orientation)
    end
    cells
  end

  def next_cell cell, orientation
    return cell.next if orientation == "horizontal"
    return cell.to_s.reverse.next.reverse.to_sym if orientation == "vertical" 
  end

  def outside_grid?(cell, ship, orientation)
    chars = cell.to_s.split(//)
    if orientation == 'vertical'
      ('j'.ord + 1) - chars[1].ord < ship.size
    else
      (11 - chars[2].to_i) < ship.size
    end
  end

end
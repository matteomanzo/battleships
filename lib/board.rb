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
    cells =  get_all_cells_for ship, orientation, cell
    raise "cant put me here " if cells.any?{|cell|grid[cell].is_a? Ship}
    cells.each {|cell|grid[cell] = ship}
  end

  def get_all_cells_for ship, orientation, cell
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

end
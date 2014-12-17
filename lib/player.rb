require_relative 'board'
require_relative 'ship'
require_relative 'game'

class Player

  attr_reader :name

  def initialize(name, board)
    @board = board
    @name = name
  end

  def place(cell, ship)
    @board.new_cell_assignment(cell, ship)
  end

end
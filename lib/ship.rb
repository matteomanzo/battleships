require_relative 'board'
require_relative 'player'

class Ship

  def initialize
    @positioned ||= false
    @sunk ||= false
  end

  def positioned?
    @positioned
  end

  def sunk?
    @sunk
  end
  
  def placed!
    @positioned = true
  end

  def sunk!
    @sunk = true
  end
  
end

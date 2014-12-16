require_relative 'board'
require_relative 'player'

class Ship

  attr_reader :size, :hit_count

  def initialize(size)
    @size = size
    @hit_count = 0
  end

  def hit!
    raise "you cant hit me im sunk" if sunk?
    @hit_count += 1
  end

  def sunk?
    size == @hit_count
  end


end

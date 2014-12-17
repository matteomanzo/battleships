require_relative 'board'
require_relative 'player'

class Ship

  attr_reader :size, :hit_count

  SHIPS = {aircraft_carrier: 5, battleship: 4, submarine: 3, destroyer: 3, patrol_boat: 2}

  def initialize(size)
    @size = size
    @hit_count = 0
  end

  def self.method_missing name
    return new SHIPS[name] if SHIPS[name]
    super
  end

  def hit!
    @hit_count += 1
  end

  def sunk?
    size == @hit_count
  end

end

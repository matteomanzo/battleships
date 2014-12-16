require_relative 'board'
require_relative 'player'

class Ship

  attr_reader :status, :size, :hit_count

  def initialize(size)
    @status ||= :floating
    @size = size
    @hit_count ||= 0
  end

  states = [:floating, :sunk]
  states.each do |status|
    define_method status do
      @status = status
    end
  end

  def hit!
    @hit_count += 1
  end

end

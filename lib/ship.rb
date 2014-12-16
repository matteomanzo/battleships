require_relative 'board'
require_relative 'player'

class Ship

  attr_reader :status, :size

  def initialize(size)
    @status ||= :floating
    @size = size
  end

  states = [:floating, :sunk]
  states.each do |status|
    define_method status do
      @status = status
    end
  end
end

require_relative 'board'
require_relative 'player'

class Ship

  attr_reader :positioned
  
  def initialize
    @positioned ||= false
  end

  def placed!
    @positioned = true
  end
end

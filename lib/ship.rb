require_relative 'grid'
require_relative 'player'

class Ship

  attr_reader :status
  
  def initialize
    @status ||= 'available'
  end

end

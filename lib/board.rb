require_relative 'player'
require_relative 'ship'

class Board

  attr_reader :grid

  def initialize
    @grid = {}
    ('a'..'j').each{|l| (1..10).each{|n| @grid["#{l}#{n}".to_sym] = :water}}
  end

end

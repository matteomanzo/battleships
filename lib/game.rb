require_relative 'board'
require_relative 'player'
require_relative 'ship'

class Game

  attr_reader :player1, :player2
 
  def initialize(name1, name2)
    @player1 = Player.new(name1, Board.new)
    @player2 = Player.new(name2, Board.new)
    
  end
end
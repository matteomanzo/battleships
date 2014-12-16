require_relative 'player'
require_relative 'ship'

class Board

  attr_reader :grid

  def initialize
    @grid = {
      'a1' => :empty, 'a2' => :empty, 'a3' => :empty, 'a4' => :empty, 'a5' => :empty, 'a6' => :empty, 'a7' => :empty, 'a8' => :empty, 'a9' => :empty, 'a10' => :empty,
      'b1' => :empty, 'b2' => :empty, 'b3' => :empty, 'b4' => :empty, 'b5' => :empty, 'b6' => :empty, 'b7' => :empty, 'b8' => :empty, 'b9' => :empty, 'b10' => :empty,
      'c1' => :empty, 'c2' => :empty, 'c3' => :empty, 'c4' => :empty, 'c5' => :empty, 'c6' => :empty, 'c7' => :empty, 'c8' => :empty, 'c9' => :empty, 'c10' => :empty,
      'd1' => :empty, 'd2' => :empty, 'd3' => :empty, 'd4' => :empty, 'd5' => :empty, 'd6' => :empty, 'd7' => :empty, 'd8' => :empty, 'd9' => :empty, 'd10' => :empty,
      'e1' => :empty, 'e2' => :empty, 'e3' => :empty, 'e4' => :empty, 'e5' => :empty, 'e6' => :empty, 'e7' => :empty, 'e8' => :empty, 'e9' => :empty, 'e10' => :empty,
      'f1' => :empty, 'f2' => :empty, 'f3' => :empty, 'f4' => :empty, 'f5' => :empty, 'f6' => :empty, 'f7' => :empty, 'f8' => :empty, 'f9' => :empty, 'f10' => :empty,
      'g1' => :empty, 'g2' => :empty, 'g3' => :empty, 'g4' => :empty, 'g5' => :empty, 'g6' => :empty, 'g7' => :empty, 'g8' => :empty, 'g9' => :empty, 'g10' => :empty,
      'h1' => :empty, 'h2' => :empty, 'h3' => :empty, 'h4' => :empty, 'h5' => :empty, 'h6' => :empty, 'h7' => :empty, 'h8' => :empty, 'h9' => :empty, 'h10' => :empty,
      'i1' => :empty, 'i2' => :empty, 'i3' => :empty, 'i4' => :empty, 'i5' => :empty, 'i6' => :empty, 'i7' => :empty, 'i8' => :empty, 'i9' => :empty, 'i10' => :empty,
      'j1' => :empty, 'j2' => :empty, 'j3' => :empty, 'j4' => :empty, 'j5' => :empty, 'j6' => :empty, 'j7' => :empty, 'j8' => :empty, 'j9' => :empty, 'j10' => :empty
    }
  end

  states = [:empty, :hit, :miss, :ship, :sunk]
  states.each do |status|
    define_method status do
      @status = status
    end
  end
end

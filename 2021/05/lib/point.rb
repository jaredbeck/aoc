# frozen_string_literal: true

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    format('%d,%d', x, y)
  end
end

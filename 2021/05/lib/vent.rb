# frozen_string_literal: true

class Vent
  def initialize(a, b)
    @a = a
    @b = b
  end

  # Yields each `Point` on the line.
  def each
    x = @a.x
    y = @a.y
    yield Point.new(x, y)
    until x == @b.x && y == @b.y
      x -= x <=> @b.x
      y -= y <=> @b.y
      yield Point.new(x, y)
    end
  end

  def to_s
    format('%s -> %s', @a.to_s, @b.to_s)
  end
end

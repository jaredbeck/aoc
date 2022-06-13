# frozen_string_literal: true

class Vent
  def initialize(start_point, end_point)
    @st = start_point
    @en = end_point
  end

  def each
    if @st.x == @en.x
      wyes = [@st.y, @en.y]
      (wyes.min .. wyes.max).each do |y|
        yield Point.new(@st.x, y)
      end
    elsif @st.y == @en.y
      exes = [@st.x, @en.x]
      (exes.min .. exes.max).each do |x|
        yield Point.new(x, @st.y)
      end
    else
      # diagonal lines not supported yet
    end
  end

  def to_s
    format('%s -> %s', @st.to_s, @en.to_s)
  end
end

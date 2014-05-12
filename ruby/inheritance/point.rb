class Point

  attr_reader :x, :y
  attr_writer :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distFromOrigin
    Math.sqrt(x*x+y*y)
  end

  def to_s
    puts "[#{x}-#{y}]"
  end

end
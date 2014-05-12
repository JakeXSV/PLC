class ThreeDPoint < Point

  attr_reader :z
  attr_writer :z

  def initialize(x,y,z)
    super(x,y)
    @z = z
  end

  def distFromOrigin
    d = super
    Math.sqrt(d*d+z*z)
  end

  def to_s
    puts "[#{x}-#{y}-#{z}]"
  end

end
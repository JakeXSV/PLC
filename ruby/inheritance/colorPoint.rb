class ColorPoint < Point

  attr_reader :color
  attr_writer :color

  def initialize(x,y,c="clear")
    super(x,y)
    @color = c
  end
end
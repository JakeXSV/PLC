=begin
Jake Prather
CS431 Exam Prep
=end

class ComplexTest

  attr_accessor :real
  attr_accessor :imag  

  def initialize(real, imag)
    @real = real
    @imag = imag
  end

  def add that
    ComplexTest.new((@real+that.real), (@imag+that.imag))
  end

  def times that
    a = @real * that.real
    b = that.real * that.imag
    c = @imag * that.real
    d = @real * that.imag
    ComplexTest.new((a-b), (c+d))
  end

  def to_s
    "(#{@real}+#{@imag}j)"  
  end

end

A = ComplexTest.new(2,3)
B = ComplexTest.new(3,4)
puts "#{A.to_s} + #{B.to_s} = #{A.add(B)}"
puts "#{A.to_s} * #{B.to_s} = #{A.times(B)}"

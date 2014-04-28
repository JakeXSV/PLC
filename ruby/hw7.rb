=begin
Jacob Prather
CS431 - PLC
Homework 7
=end

class MyVector

  @array
  attr_accessor :array

  def initialize(array)
    @array=array
  end

  def length
    @array.length
  end

  def *(a)
    # Vector * Vector
    if a.instance_of?(MyVector)

      if @array.length != a.length
        raise ArgumentError, 'Vector is incorrect size'
      end
      r = 0
      @array.zip(a.array).each do |x,y|
        r = r+(x*y)
      end
      r

    # Vector * Matrix
    elsif a.instance_of?(MyMatrix)

      if ((a.matrix).length != @array.length)
        raise ArgumentError, 'Matrix has incorrect number of rows'
      end

      len = a.matrix[0].array.length
      a.matrix.each do |x|
        if (x.array.length != len)
          raise ArgumentError, 'Matrix argument has inconsistent columns'
        end
        len = x.array.length
      end

      res = MyVector.new(Array.new)
      @array.each do
        res.array << 0
      end
      arrayCount = 0
      @array.each do |i|
          aCount = 0;
        a.matrix[arrayCount].array.each do
          res.array[aCount] += i * a.matrix[arrayCount].array[aCount]
          aCount = aCount + 1
        end
        arrayCount = arrayCount + 1
      end
      res

    else
      raise ArgumentError, 'Wrong type for MyVector *'
    end
  end

  def to_s
    x = ''
    @array.each do |e|
      x = x.concat(e.to_s).concat(' ')
    end
    x
  end

end

class MyMatrix

  @matrix
  attr_accessor :matrix

  def initialize(a)
    @matrix = Array.new
    a.each do |i|
      @matrix.push(MyVector.new(i))
    end
  end

  def transpose(a)
    res = Array.new
    a.matrix[0].array.each do
      res.push(Array.new)
    end
    a.matrix.each do |e|
      count = 0
      e.array.each do |z|
        res[count].push(z)
        count = count + 1
      end
    end
    MyMatrix.new(res)
  end

  def *(a)
    if !((@matrix[0]).array.length == a.matrix.length)
      raise ArgumentError, 'Incompatible'
    end

    aFixed = transpose(a)
    res = Array.new
    @matrix.each do |i|
      curr = Array.new
      aFixed.matrix.each do |j|
        curr << i*j
      end
      res.push(curr)
    end
    MyMatrix.new(res)
  end

  def to_s
    x = "\n"
    @matrix.each do |e|
      x = x.concat(e.to_s).concat("\n")
    end
    x
  end

end

#Test Code

v = MyVector.new([1,2,3])
puts "v = #{v.to_s} \n"

v1 = MyVector.new([2,3,4])
puts "v1 = #{v1.to_s} \n"

puts "v * v1 = #{(v*v1).to_s}"

m = MyMatrix.new([[1,2],[1,2],[1,2]])
puts "m = #{m.to_s}"

puts "v * m = #{(v * m).to_s}"

m1 = MyMatrix.new([[1,2,3],[2,3,4]])
puts "m1 = #{(m1).to_s}"

puts "m * m1 = #{(m*m1).to_s}"

puts "m1 * m = #{(m1*m).to_s}"

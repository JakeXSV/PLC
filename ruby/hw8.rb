=begin
Jacob Prather
CS431 - PLC
Homework 8
=end

class Leaf

  @value
  attr_accessor :value

  def initialize(e)
    @value = e
  end

  def concatAll
    @value
  end

  def firstAlphabetical
    @value
  end

  def iterate(e)
    e.call(@value)
  end

end

class BinaryNode

  @left
  @right
  attr_accessor :left
  attr_accessor :right

  def initialize(a,b)
    @left = a
    @right = b
  end

  def concatAll
    @left.concatAll + @right.concatAll
  end

  def firstAlphabetical
    x = (@left.firstAlphabetical).casecmp(@right.firstAlphabetical)
    result = ""
    if x == -1
	result = @left.firstAlphabetical
    else
	result = @right.firstAlphabetical
    end
    result
  end

  def iterate(e)
    @left.iterate(e)
    @right.iterate(e)
  end

end

def test_tree
  l0 = Leaf.new "What "
  l1 = Leaf.new "a "
  l2 = Leaf.new "great "
  l3 = Leaf.new "day."
  i0 = BinaryNode.new(l0,l1)
  i1 = BinaryNode.new(i0, l2)
  i2 = BinaryNode.new(i1, l3)
  puts "Tree concatendated:\t #{i2.concatAll}"
  puts
  puts "tree first alphabetical:\t #{i2.firstAlphabetical}"
  puts
  i = 0
  i2.iterate(lambda { |s| i=i+1; puts i.to_s + ": " + s})
end

test_tree

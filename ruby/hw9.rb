=begin
Jacob Prather
PLC CS431
Homework 9
=end

class Leaf
	attr_accessor :data
	def initialize s 
		@data = s
	end

	def concatAll
		@data
	end

	def firstAlphabetical 
		@data
	end

	def iterate(itr)
		itr.call(@data)
	end
end

class BinaryNode

	def initialize (left, right)
		@left = left
		@right = right
	end

	def concatAll
		@left.concatAll + @right.concatAll
	end

	# not part of the homework
	def BinaryNode.firstAlphabetical (s1, s2)
		if s1.casecmp(s2) < 0 then s1 else s2 end
	end

	def firstAlphabetical 
		s1 = @left.firstAlphabetical
		s2 = @right.firstAlphabetical	
		if s1.casecmp(s2) < 0 then s1 else s2 end
	end

	def iterate itr
		@left.iterate itr
		@right.iterate itr	
	end

	def BinaryNode.concatAll tree
		s = "";
		tree.iterate(lambda { |data| s = s + data })
		s
	end

end


class NaryNode
	def initialize childArray
	  # assume childArray is an array object
	  # make sure that the array is not empty and raise an exception otherwise.
	  # clone a copy of the childArray (using the clone method on array) and store it internally to @childArray
	  if(childArray.length == 0) then raise ArgumentError "Empty childArray"
	  else
	    @childArray = childArray.clone
	  end
	end

	def iterate itr
	  # use the "each" method of array to pass "itr" to the iterate method of each element in @childArray
	  @childArray.each do |e|
	    e.iterate itr
	  end
	end

	def concatAll 
	  # use the "inject" method of array to concatenate the strings of each node in @childArray
	  result = ''
	  @childArray.each do |e| 
	    result = result + e.concatAll
	  end
	  result
	end

	def firstAlphabetical
	  # use the "inject" method of array to retrieve the smallest string of the nodes in @childArray
	  result = @childArray[0].firstAlphabetical
	  @childArray.each do |e|
	  e = e.firstAlphabetical
	    if e.casecmp(result) < 0 then
	      result = e
      	    end
	  end
    	  result
	end
end

class String
	def iterate itr
	  itr.call(self)
	end
	def concatAll
	  self
	end
	def firstAlphabetical
	  self
	end
end

module TreeEnum
	def any? f
	  # assume "f" is a lambda (not a block)
	  # use the "iterate" method of "self" to find out whether when "f" is applied to any element in "self", it returns true.
	  # Note that since "TreeEnum" is mixed into tree node classes, it assumes that "iterate" method takes a lambda as argument
	  res = false
	  self.iterate(lambda{|e|
	    if(f.call(e)) then
	      res = true
	    end
	  })
	  res
	end

	def inject (f, c)
	  # assume "f" is a lambda and "c" is the initial value
	  # use the "iterate" method of "self" to accumulatively apply "f" to each element in "self" with "c" as the initial value
	  self.iterate(lambda{|e|
	    c = f.call(c,e)
	  })
	  c
	end
end

class BinaryNode
	include TreeEnum
end
class NaryNode
	include TreeEnum
end


def test_print t2
  puts "t2.concatAll: " + t2.concatAll.to_s
  puts
  puts "t2.firstAlphabetical: " + t2.firstAlphabetical.to_s
  puts
  puts "t2.iterate(lambda { |s| puts s }):"  
  t2.iterate(lambda { |s| puts s })
end

def test_tree
  l0 = Leaf.new "What "
  l1 = Leaf.new "a "
  l2 = Leaf.new "great "
  l3 = Leaf.new "day"
  l4 = Leaf.new "!"
  t0 = BinaryNode.new(l0,l1)
  t1 = BinaryNode.new(t0,l2)
  t2 = NaryNode.new([t1,l3,l4])
  
  test_print t2

  puts "\nThe following works after question 2\n\n"

  t2 = NaryNode.new([t1, "day", "!"])

  test_print t2

  puts "\nThe following works after question 3\n\n"

  puts "any word starting with `great': " + t2.any?(lambda {|x| x.start_with?("great")}).to_s
  puts "any word starting with 'tttt': " + t2.any?(lambda {|x| x.start_with?("tttt")}).to_s
  puts
  puts "capitalize: " + t2.inject((lambda {|acc, elm| acc + elm.capitalize + " "}), "")
end

test_tree

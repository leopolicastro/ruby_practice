#
# .map "maps" the result of the block back to the array
#   (i.e. [1, 2, 3].map{|x| x * 3} multiplies each element by three)
#   on the given block. It creates a new array, containing the values of
#   the block.
# ----------------------------------------------------
# .inject combines elements of an array using the specified operator
#   and arguments. (i.e. example_array.inject(:+) will find the sum of the array)
# ----------------------------------------------------
# .select chooses the elements of an array that are passed into a block,
#   (i.e. array = [1,2], array.select {|x| x == 1} => 1)
#   If the block evaluates to true, .select keeps those elements!
# ----------------------------------------------------
# "yield" gives control over to a {block and returns value};
#   you can also pass in parameters if need be.
#  ---------------------------------------------------
# .sort makes a new, sorted (AaBb) array out of the elements in the given array.
#

class Array #reopening array class, ruby core library (monkey patching)

  def my_select
    a = []
    self.each do |e|
      a << e if yield(e)
    end
    a
  end

  def my_map
    a = []
    self.each do |e|
      a << yield(e) #substituting every element of the array to the return value of the block
    end
    a
  end

  def my_inject
    result = 0
    self.each do |e|
      result = yield(result, e)
    end
    result
  end

end

#driver code
array = [1, 2, 3]
p [1, 2, 3].my_select { |e| e.odd? }
p array.my_map {|e| e * 0 }

p [1, 2, 3].my_inject { |a, b| a += b } == 6
p [0, 29, 9].my_inject { |a, b| a *= b } == 0
p [1, 2, 3].my_inject { |a, b| a -= b } == -6

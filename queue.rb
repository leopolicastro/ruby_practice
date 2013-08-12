class Queue
  attr_reader :pocket
  def initialize
    @pocket = []
  end
 
  def put_in_pocket(thing)
    @pocket << thing
  end
 
  def remove_from_pocket
    @pocket.shift
  end
 
  def peek_in_pocket
    @pocket.last
  end
 
  def empty?
    @pocket.empty?
  end
end

#add some stuff to the pocket

my_pocket = Queue.new
my_pocket.put_in_pocket(["thing", "lint", "candy"])
my_pocket.put_in_pocket("pen")
puts "Pocket contents: #{my_pocket.pocket.join(', ')}"
my_pocket.remove_from_pocket
puts "Pocket contents: #{my_pocket.pocket.join(', ')}"

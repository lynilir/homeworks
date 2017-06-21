# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'topological_sort'
require_relative 'graph'

def install_order(arr)
  # max_id = arr.flatten.max
  vertices = []
  arr.flatten.uniq.each do |id|
    ver = Vertex.new(id)
    vertices << ver
  end

  arr.each do |tuple|
    if tuple[1]
      id, dep = tuple
      Edge.new(vertices[dep - 1], vertices[id - 1])
    end
  end

  topological_sort(vertices).map { |v| v.value }
end


# def install_order2(arr)
#   vertices = []
#   sorted = []
#   arr.flatten.uniq.each do |val|
#     ver = Vertex.new(val)
#     vertices << ver
#   end
#
#   arr.each do |tuple|
#     if tuple[1]
#       Edge.new(tuple[1], tuple[0])
#     else
#       sorted.push()
#     end
#   end
#
#   toposorted
# end

arr = [[3, 1], [2, 1], [6, 5], [3, 6], [3, 2], [4, 3], [9, 1], [1, nil], [5, nil]]
arr2 = [['a', 'b'], ['c', 'b'], ['d', 'a'], ['b'], ['e', 'd']]

p install_order(arr)
p install_order(arr2)

# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'topological_sort'
require_relative 'graph'

def install_order(arr)
  max_id = arr.flatten.max
  vertices = []
  (1..max_id).each do |id|
    ver = Vertex.new(id)
    vertices << ver
  end

  arr.each do |tuple|
    id, dep = tuple
    Edge.new(vertices[dep - 1], vertices[id - 1])
  end

  topological_sort(vertices).map { |v| v.value }
end

require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  top_queue = []
  sorted = []
  in_edges_count = {}
  #
  vertices.each do |v|
    in_edges_count[v] = v.in_edges.count
    top_queue << v if v.in_edges.empty?
  end

  until top_queue.empty?
    top_vertex = top_queue.shift

    top_vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex
      in_edges_count[to_vertex] -= 1
      top_queue << to_vertex if in_edges_count[to_vertex] == 0
    end

    sorted.push(top_vertex)
  end

  # needs to be a more robust check for cycle
  if (in_edges_count.values.all? { |count| count == 0 })
    return sorted
  else
    return []
  end
end

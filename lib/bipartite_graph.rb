class BipartiteGraph

  def self.match(left_vertices, right_vertices, edges)
    vertices = left_vertices + right_vertices + [:sink, :source]
    edges[:sink] = {}
    edges[:source] = {}
    
    left_vertices.each do |left_vertice|
      edges[:source][left_vertice] = 0
    end
    right_vertices.each do |right_vertice|
      edges[right_vertice] = { sink: 0 }
    end
    graph = { vertices: vertices, edges: edges }
    matching = graph_matching! graph
  end

  def self.graph_matching!(graph, source = :source, sink = :sink)
    loop do
      path = get_augmenting_path graph
      break unless path
      create_augment_flow graph, path
    end
    matching_in graph, source, sink
  end

  def self.get_augmenting_path(graph, source = :source, sink = :sink)
    parents = search graph, source, sink
    return nil unless parents[sink]
    path = []
    current_vertex = sink
    until current_vertex == source
      path << [parents[current_vertex], current_vertex]
      current_vertex = parents[current_vertex]

      if path.length > parents.length
        raise "Cannot terminate. Use integral edge weights."
      end
    end
    path.reverse!
  end

  def self.create_augment_flow (graph, path)
    edges = graph[:edges]
    path.each do |u, v|
      edges[v] ||= {}
      edges[v][u] = -edges[u][v]
      edges[u].delete v
    end
  end

  def self.search(graph, source = :source, sink = :sink)
    parents = { source => true }
    queue = [source]
    until queue.empty?
      current_vertex = queue.shift
      break if current_vertex == sink
      (graph[:edges][current_vertex] || {}).each do |new_vertex, edge|
        next if parents[new_vertex]
        parents[new_vertex] = current_vertex
        queue << new_vertex
      end
    end

    parents
  end

  def self.matching_in(graph, source = :source, sink = :sink)
    Hash[*((graph[:edges][sink] || {}).keys.map { |matched_vertex|
      [graph[:edges][matched_vertex].keys.first, matched_vertex]
    }.flatten)]
  end
end

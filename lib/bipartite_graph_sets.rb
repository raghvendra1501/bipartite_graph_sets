require_relative 'bipartite_graph'

class BipartiteGraphSets

  def self.get_perfect_match requirement_hash
    left_vertices, right_vertices, edges = get_vertices_and_edges requirement_hash
    problem_set_matching = BipartiteGraph.match left_vertices, right_vertices, edges
    matched_solution problem_set_matching
  end

  def self.get_vertices_and_edges requirement_hash
    left_vertices = []
    right_vertices = []
    edges = {}
    requirement_hash.each do |key, value|
       left_vertices << value[:options]
       value[:options].each do |v|
        edges[v] ||= {}
        (1..value[:selection]).each do |n|
          key_name = "#{key}_#{n}"
          right_vertices << key_name
          edges[v][key_name] = 0
        end
      end
    end
    [ left_vertices.flatten.uniq.shuffle, right_vertices.flatten.uniq.shuffle, edges ]
  end

  def self.matched_solution problem_set_matching
    solution_hash = {}
    problem_set_matching.to_h.each do |k,v|
      key = v.to_s.split('_').first
      solution_hash[key] ||= []
      solution_hash[key] << k
    end
    solution_hash
  end
end
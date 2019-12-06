# bipartite_graph_sets
Job Assignment problem solution with the help of bipartite graph
It uses bipartite graph problem to solve the job assignment problem.
Suppose I have A number of jobs and B number of candidates, each candidate wants to choose jobs from a list which will be subset of A, and each job can take only few fixed number of candidates.
In short one candidate can join only one job, and on one job fixed number of candidates can join. Then to find a solution so that each job can get required number of candidates.

<code>

requirement_hash = {
  'A' => {
    options: [100, 101, 102, 103],
    selection: 2
  },
  'B' => {
    options: [101, 102, 103, 104],
    selection: 2
  },
  'C' => {
    options: [99, 103, 104],
    selection: 2
  }
}



> BipartiteGraphSets.get_perfect_match requirement_hash
=> {"A"=>[102, 100], "B"=>[103, 101], "C"=>[99, 104]}
=>  or
=> {"B"=>[102, 103], "A"=>[101, 100], "C"=>[99, 104]}
</code>

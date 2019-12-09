# Bipartite Graph Sets (Solutions of Job assignment problem)

<br>

Job Assignment problem is very common, and after a lot of searching here and there, I got to know it is actually a <a href='https://en.wikipedia.org/wiki/Bipartite_graph'>Bipartite Graph Problem</a></br>
Job assignment problem can be explained as, suppose there are <b>A</b> number of candidates, and <b>B</b> number of jobs. each candidate has filed application for <b>b</b> jobs which is a subset of <b>B</b>. but he can join only 1 job.
But for each job some fixed number of candidates can be assigned out of b. So we need to found the maximum number of candidate that can find job and get to know who gets what job. <br>

<b>For example:</b><br/>
<code>

    candidates = [99, 100, 101, 102, 103, 104]
  
    Jobs = ['A', 'B', 'C']
  
    Applications for job A are = [100, 101, 102, 103]
    Openings in A = 2
  
    Applications for job B are = [101, 102, 103, 104]
    Openings in B = 2
  
    Applications for job C are = [99, 103, 104]
    Openings in C = 2
</code>

In the above sample set, selection should be in such a manner <br>
<ul>
  <li>
    Maximum candidates gets the job
  </li>
 <li>
   No candidate gets more than 1 job
  </li>
  <li>
    Each job gets maximum number of positions filled
  </li>
</ul>

For using the solution you need to install the gem 

<code>
  
    gem 'bipartite_graph_sets'

</code>

by running 

<code>
    
    bundle install

</code>

or directly install it by

<code>

     gem install 'bipartite_graph_sets'

</code>

As per the given example you need to create requirement hash in this format:

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
    => # or
    => {"B"=>[102, 103], "A"=>[101, 100], "C"=>[99, 104]}

</code>

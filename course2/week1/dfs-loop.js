// DFS-Loop

const DFSLoop = (graph) => {
  // Count how many nodes we've explored totally
  // For finishing times in 1st pass
  const t = 0;
  // Most recent vertex from which a DFS was initiated
  // For leaders in 2nd pass
  const s = null;
  
  const finish = {}; // Finishing times
  const explored = {}; // Explored vertices
  const leader = {}; // Leader tracking

  // Assume nodes labeled (1 to n)
  // For i = n downto 1
    // if i is not yet explored
      // s := i
      // DFS(G, i)

  const DFS = (graph, node) => {
    // Mark i as explored
    // set leader(i) := s
    // for each arc (i, j) ∈ G:
      // if j not yet explored:
        // DFS(G, j)
    // t += 1
    // set f(i) := t
  }
}


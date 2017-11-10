// DFS-Loop

const DFSLoop = (graph) => {
  // Reverse the graph
  const reversed = reverseG(graph);
  // Count how many nodes we've explored totally
  // For finishing times in 1st pass
  const t = 0;
  // Most recent vertex from which a DFS was initiated
  // For leaders in 2nd pass
  const s = null;
  
  const finish = {}; // Finishing times
  const explored = {}; // Explored vertices
  const leader = {}; // Leader tracking

  // Initialize all vertices
  for (const vertex in revG) {
    explored[vertex] = false;
    finish[vertex] = Number.NEGATIVE_INFINITY;
  }
  // Assume nodes labeled (1 to n)
  // For i = n downto 1
  for (const vertex in revG) {
    // if i is not yet explored
    if (!explored[vertex]) {
      // s := i
      s = vertex;
      // DFS(G, i)
      DFS(reversed, vertex);
    }
  }

  const DFS = (graph, i) => {
    // Mark i as explored
    explored[i] = true;
    // set leader(i) := s
    leader[i] = s;
    // for each arc (i, j) ∈ G:
    const neighbors = graph[i];
    for (let j = 0; j < neighbors.length; j++) {
      // if j not yet explored:
      if (!explored[j]) {
        // DFS(G, j)
        DFS(graph, j);
      }
    }
    // t += 1
    t += 1;
    // set f(i) := t
    finish[i] = t;
  }
}

// DAG reversal algorithm
const reverseG = (graph) => {
  // Reverse copy
  const rev = {};
  for (const vertex in graph) {
    const neighbors = graph[vertex];

    for (let i = 0; i < neighbors.length; i++) {
      if (!rev.hasOwnProperty(neighbors[i])) {
        rev[neighbors[i]] = [vertex];
      }
      else {
        rev[neighbors[i]].push(vertex);
      }
    }
  }
  return rev;
}

// Adjacency list
const adjList = {
  1: [4],
  4: [7],
  7: [1],
  9: [3, 7],
  3: [6],
  6: [9],
  8: [6, 5],
  2: [8],
  5: [2]
}

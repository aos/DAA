// DFS-Loop

const DFSLoop = (graph) => {
  // Reverse the graph
  const reversed = reverseG(graph);
  const stack = [];
  // Count how many nodes we've explored totally
  // For finishing times in 1st pass
  let t = 0;
  // Most recent vertex from which a DFS was initiated
  // For leaders in 2nd pass
  let s = null;
  
  const finish = {}; // Finishing times
  const exploreOne = {}; // Explored vertices
  const exploreTwo = {}; // Explored vertices
  const leader = {}; // Leader tracking

  // Initialize all vertices
  for (const vertex in reversed) {
    exploreOne[vertex] = false;
    exploreTwo[vertex] = false;
    finish[vertex] = Number.NEGATIVE_INFINITY;
  }

  // First pass -- reversed graph, gather finishing times
  for (const vertex in reversed) {
    // if i is not yet explored
    if (!exploreOne[vertex]) {
      // DFS(G, i)
      DFS(reversed, vertex, 1);
    }
  }

  // Second pass -- in decreasing order of finishing times, gather leaders
  while (stack.length > 0) {
    const vert = stack.pop();  
    if (!exploreTwo[vert]) {
      // s := i
      s = vert;
      DFS(graph, vert, 2);
    }
  }

  function DFS(graph, i, pass) {
    // Mark i as explored
    if (pass === 1) {
      exploreOne[i] = true;
    }
    else if (pass === 2) {
      // set leader(i) := s
      leader[i] = s;
      exploreTwo[i] = true;
    }

    // for each arc (i, j) ∈ G:
    const neighbors = graph[i];
    for (let j = 0; j < neighbors.length; j++) {
      // if j not yet explored:
      if (pass === 1) {
        if (!exploreOne[neighbors[j]]) {
          // DFS(G, j)
          DFS(graph, neighbors[j], 1);
        }
      }
      else if (pass === 2) {
        if (!exploreTwo[neighbors[j]]) {
          // DFS(G, j)
          DFS(graph, neighbors[j], 2);
        }
      }
    }

    if (pass === 1) {
      // t += 1
      t += 1;
      // set f(i) := t
      finish[i] = t;
      // Push on to stack by order of finishing time (for second pass)
      stack.push(i);
    }
  }
  return {
    finish,
    leader
  };
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
  A: ['B'],
  B: ['C'],
  C: ['A', 'D'],
  D: ['F', 'G'],
  E: ['D'],
  F: ['E'],
  G: ['I'],
  H: ['G'],
  I: ['H']
}

console.log(DFSLoop(adjList));

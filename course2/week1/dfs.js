/* Depth-first search */
const Stack = require('../stack');

// Recursive implementation
module.exports = function DFS(graph, start) {

  // Recursive implementation
  function DFSVisit(vertex) {
    explored[vertex] = true;
    const vs = graph[vertex];
    for (let i = 0; i < vs.length; i++) {
      if (!explored[vs[i]]) {
        explored[vs[i]] = true;
        DFSVisit(vs[i]);
      }
    }
    f[vertex] = currentLabel;
    currentLabel -= 1;
  }

  const explored = {};
  const f = {}; // Vertex ordering for topological sort
  let currentLabel = 0;
  
  // Initialize all vertices as unexplored
  // currentLabel is set to # of vertices
  for (const vertex in graph) {
    explored[vertex] = false;
    currentLabel += 1;
  }

  // Mark first as explored
  explored[start] = true;

  // Grab connected vertices
  const vs = graph[start];

  for (let i = 0; i < vs.length; i++) {
    if (!explored[vs[i]]) {
      // Explore vertex
      DFSVisit(vs[i]);
    }
  }
  f[start] = currentLabel;

  return f; // Return the topological sorting of DAG
}

// Iterative -- using a stack
function DFSTwo(graph, start) {
  const myStack = new Stack();
  const explored = {};
  const d = {}; // Distance
  let time = 0;

  // Initialize unexplored
  for (const vertex in graph) {
    explored[vertex] = false;
    d[vertex] = Number.POSITIVE_INFINITY;
    f[vertex] = 0;
  }

  // Explore and add to stack
  explored[start] = true;
  d[start] = 0;
  myStack.push(start);

  while (!myStack.isEmpty()) {
    const v = myStack.pop();
    const neighbors = graph[v];

    for (let i = 0; i < neighbors.length; i++) {
      if (!explored[neighbors[i]]) {
        explored[neighbors[i]] = true;
        d[neighbors[i]] = d[v] + 1;
        myStack.push(neighbors[i]);
      }
    }
  }
}

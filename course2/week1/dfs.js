/* Depth-first search */
const Stack = require('../stack');

// Recursive implementation
function DFS(graph, start) {

  function DFSVisit(vertex) {
    const vs = graph[vertex];
    for (let i = 0; i < vs.length; i++) {
      if (!explored[vs[i]]) {
        explored[vs[i]] = true;
        DFSVisit(vs[i]);
      }
    }
  }

  const explored = {};
  // Initialize all vertices as unexplored
  for (const vertex in graph) {
    explored[vertex] = false;
  }

  // Mark first as explored
  explored[start] = true;

  // Go through connected vertices
  const vs = graph[start];

  for (let i = 0; i < vs.length; i++) {
    if (!explored[vs[i]]) {
      // Explore vertex
      explored[vs[i]] = true;
      DFSVisit(vs[i]);
    }
  }
}

// Iterative -- using a stack
function DFSTwo(graph, start) {
  const myStack = new Stack();
  const explored = {};

  // Initialize unexplored
  for (const vertex in graph) {
    explored[vertex] = false;
  }

  // Explore and add to stack
  explored[start] = true;
  myStack.push(start);

  while (!myStack.isEmpty()) {
    const v = myStack.pop();
    const neighbors = graph[v];

    for (let i = 0; i < neighbors.length; i++) {
      if (!explored[neighbors[i]]) {
        explored[neighbors[i]] = true;
        myStack.push(neighbors[i]);
      }
    }
  }
}

/* Build graph */
const {GraphPrototype} = require('../graph');
const myGraph = new GraphPrototype();

myGraph.addVertex('S');
myGraph.addVertex('A');
myGraph.addVertex('B');
myGraph.addVertex('C');
myGraph.addVertex('D');
myGraph.addVertex('E');

myGraph.addEdge('S', 'A');
myGraph.addEdge('S', 'B');
myGraph.addEdge('A', 'C');
myGraph.addEdge('B', 'C');
myGraph.addEdge('B', 'D');
myGraph.addEdge('C', 'D');
myGraph.addEdge('C', 'E');
myGraph.addEdge('D', 'E');

const list = myGraph.getList();
DFS(list, 'B');
DFSTwo(list, 'S');

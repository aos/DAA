// Breadth-first search implementation

const Queue = require('../queue');

module.exports = function BFS(graph, start) {
  const explored = {};
  const dist = {};
  const myQueue = new Queue();

  // Initialize all vertices as unexplored with infinite distance
  for (const vertex in graph) {
    explored[vertex] = false;
    dist[vertex] = Number.POSITIVE_INFINITY;
  }

  // Mark start vertex as explored with distance = 0
  explored[start] = true;
  dist[start] = 0;
  myQueue.enqueue(start);

  while (!myQueue.isEmpty()) {
    // Remove first node of Q
    const v = myQueue.dequeue();
    const neighbors = graph[v];
    
    // Cycle through incident edges 
    for (let i = 0; i < neighbors.length; i++) {
      // Explore each adjacent vertex 
      if (!explored[neighbors[i]]) {
        explored[neighbors[i]] = true;
        dist[neighbors[i]] = dist[v] + 1;
        // Queue each adjacent vertex 
        myQueue.enqueue(neighbors[i]);
      }
    }
  }
}

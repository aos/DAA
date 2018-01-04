// Dijkstra's algorithm -- current implementation using adjancency list/graph

const LineByLineReader = require('line-by-line');

const pQueue = require('../priority'); 
const INF = Number.POSITIVE_INFINITY;

const dijkstra = (graph, source, lengths) => {
  // Min-priority queue
  const pQ = new pQueue();
  const dist = {};
  // Initialize distances from source
  for (const v in graph) {
    dist[v] = INF;
  }

  // Initialize source
  dist[source] = 0;
  pQ.enqueue(source, dist[source]);
  // For pedagogy -> predecessor 
  const B = {};

  // Main loop (X ≠ V):
  while (!pQ.isEmpty()) {
    const curr = pQ.dequeue().element;

    // BFS through neighboring vertices
    // Adding shortest distance vertex as highest priority
    const neighbors = graph[curr];
    // Check for empty set
    if (neighbors) {
      for (const vert of neighbors) {
        // Calculate tentative distance:
        // Distance of dequeued vertex + edge length to neighboring vert
        const tentativeDist = dist[curr] + lengths[curr][vert];
        if (tentativeDist < dist[vert]) {
          dist[vert] = tentativeDist;
          B[vert] = curr;
          pQ.enqueue(vert, dist[vert]);
        }
      }
    }
  }
  return {
    distanceFromSource: dist,
    predecessor: B
  }
}

// Example graph (adjacency list)
const G = {
  1: new Set([2, 3]),
  2: new Set([4]),
  3: new Set([4, 5]),
  4: new Set([5]),
  5: new Set()
};
const lengths = [
  [],
  [null, null, 1, 2],
  [null, null, null, null, 4],
  [null, null, null, null, 5, 6],
  [null, null, null, null, null, 2],
  []
]; 

function computeDijkstras(file) {
  const lr = new LineByLineReader(file);
  const graph = {};
  const lengths = [];
  process.stdout.write('Building graph and lengths matrix from file... ');

  // Build adjancency list from file
  lr.on('line', (line) => {
    const splitLine = line.split(/\s/);
    const vert = parseInt(splitLine[0]);
    if (!graph.hasOwnProperty(vert)) {
      graph[vert] = new Set(); 
    }
    for (let i = 1; i < splitLine.length; i++) {
      let splitLenVertPair = splitLine[i].split(',');
      splitLenVertPair = splitLenVertPair.map(i => parseInt(i));
      graph[vert].add(splitLenVertPair[0]);
      if (!lengths[vert]) {
        lengths[vert] = [];
        lengths[vert][splitLenVertPair[0]] = splitLenVertPair[1];
      }
      else {
        lengths[vert][splitLenVertPair[0]] = splitLenVertPair[1];
      }
    }
  });
  lr.on('end', () => {
    console.log('Done.');
    process.stdout.write('Computing shortest path... ');
    const result = dijkstra(graph, 1, lengths);
    console.log('Done.');
    const req = [7, 37, 59, 82, 99, 115, 133, 165, 188, 197];
    const parsed = [];
    for (const v in result.distanceFromSource) {
      if (req.includes(parseInt(v))) {
        parsed.push(result.distanceFromSource[v]);
      }
    }
    console.log(parsed);
  });
}

computeDijkstras('./dijkstraData.txt');

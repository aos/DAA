const LineByLineReader = require('line-by-line');

// DFS-Loop
const DFSLoop = (graph) => {
  // Reverse the graph
  const reversed = reverseG(graph);
  const stack = [];
  // Most recent vertex from which a DFS was initiated
  let s = null;
  const exploreOne = {}; // Explored vertices first pass
  const exploreTwo = {}; // Explored vertices second pass
  const leader = {}; // Leader tracking

  // Initialize all vertices
  for (const vertex in reversed) {
    exploreOne[vertex] = false;
    exploreTwo[vertex] = false;
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

  // Iterative
  function iterDFS(graph, i, pass) {
    const vertStack = [];
    if (pass === 1) {
      exploreOne[i] = true;
    }
    else {
      leader[i] = s;
      exploreTwo[i] = true;
    }
    vertStack.push(i);
    while (vertStack.length > 0) {
      const start = vertStack.pop();
      const neighbors = graph[start];
      for (const v of neighbors) {
        if (pass === 1) {
          if (!exploreOne[v]) iterDFS(graph, v, 1);
        }
        else {
          if (!exploreTwo[v]) iterDFS(graph, v, 2);
        }
      }
    }
    if (pass === 1) stack.push(i);
  }
  // Recursive
  function DFS(graph, i, pass) {
    if (pass === 1) exploreOne[i] = true;
    else if (pass === 2) {
      leader[i] = s;
      exploreTwo[i] = true;
    }
    // for each arc (i, j) ∈ G:
    const neighbors = graph[i];
    for (const v of neighbors) {
      if (pass === 1 && !exploreOne[v]) DFS(graph, v, 1);
      else if (pass === 2 && !exploreTwo[v]) DFS(graph, v, 2);
    }
    // Push on to stack by order of finishing time (for second pass)
    if (pass === 1) stack.push(i);
  }
  return leader;
}

// DAG reversal algorithm
const reverseG = (graph) => {
  // Reverse copy
  const rev = {};
  for (const vertex in graph) {
    const neighbors = graph[vertex];
    for (const v of neighbors) {
      if (!rev.hasOwnProperty(v)) {
        rev[v] = new Set([vertex]);
      }
      else {
        rev[v].add([vertex]);
      }
    }
  }
  return rev;
}

function computeSCCs(file) {
  const lr = new LineByLineReader(file);
  const graph = {};
  process.stdout.write('Building graph from file... ');

  // Build adjancency list from file
  lr.on('line', (line) => {
    const splitLine = line.split(/\s/);
    const vert = splitLine[0];
    if (!graph.hasOwnProperty(vert)) {
      graph[vert] = new Set(); 
    }
    graph[vert].add([splitLine[1]]);
  });

  lr.on('end', () => {
    console.log('Done.');
    process.stdout.write('Computing SCCs... ');
    const result = DFSLoop(graph);
    console.log('Done.');
    const counter = {};

    process.stdout.write('Building results...');
    for (const lead in result) {
      if (counter.hasOwnProperty(result[lead])) {
        counter[result[lead]]++;
      }
      else {
        counter[result[lead]] = 1;
      }
    }
    console.log('Done.');
    return console.log(Object.values(counter).filter(i => i > 1));
  });
}

computeSCCs('./_410e934e6553ac56409b2cb7096a44aa_SCC.txt');

const fs = require('fs');

// Graph implementation
function Graph() {
  const adjList = {};

  this.addVertex = function(v) {
    adjList[v] = [];
  }

  this.addEdge = function(v, w) {
    if (adjList[v].indexOf(w) === -1) {
      adjList[v].push(w);
    }
    // Commented out for directed graphs
    // if (adjList[w]) {
    //   if (adjList[w].indexOf(v) === -1) {
    //     adjList[w].push(v);
    //   }
    // }
  }

  this.getList = function() {
    return adjList;
  };

  this.print = function() {
    let s = '';
    for (const key in adjList) {
      s += `${key} -> `;
      adjList[key].forEach(x => s += `${x} `);
      s += '\n';
    }
    return s;
  }
}

function buildGraph(file) {
  const newGraph = new Graph();
  const arr = fs.readFileSync(file, 'utf-8').split(/\s/);

  let newV = 2;
  let prev;
  arr.forEach((x) => {
    if (newV == 2) {
      if (x) newGraph.addVertex(x);
      prev = x;
      newV = 0;
      return;
    }

    if (!x) {
      newV += 1;
      return;
    }

    if (x) newGraph.addEdge(prev, x);
  })
  return newGraph.getList();
}

module.exports = {
  GraphPrototype: Graph,
  buildGraphFromFile: buildGraph
} 

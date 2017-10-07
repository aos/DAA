const fs = require ('fs');
const GraphPrototype = require('./graph.js')

const Graph = new GraphPrototype();

const arr = fs.readFileSync('./kargerMinCut.txt', 'utf-8').split(/\s/);

let newV = 2;
let prev;
arr.forEach((x) => {
  if (newV == 2) {
    if (x) Graph.addVertex(x);
    prev = x;
    newV = 0;
    return;
  }

  if (!x) {
    newV += 1;
    return;
  }

  if (x) Graph.addEdge(prev, x);
})

console.log(Graph.print());


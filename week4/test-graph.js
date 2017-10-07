const GraphPrototype = require('./graph.js')

const Graph = new GraphPrototype();

Graph.addVertex('A'); 
Graph.addVertex('B'); 
Graph.addVertex('C'); 

Graph.addEdge('A', 'B');
Graph.addEdge('B', 'C');
Graph.addEdge('C', 'A');

console.log(Graph.print());


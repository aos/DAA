const {GraphPrototype, buildGraph} = require('./graph');

const Graph = new GraphPrototype();

Graph.addVertex('A');
Graph.addVertex('B');
Graph.addVertex('C');
Graph.addVertex('D');
Graph.addVertex('E');
Graph.addVertex('F');

Graph.addEdge('A', 'B');
Graph.addEdge('B', 'C');
Graph.addEdge('B', 'E');
Graph.addEdge('C', 'D');
Graph.addEdge('D', 'E');
Graph.addEdge('D', 'F');
Graph.addEdge('E', 'F');

const manual = Graph.getList();
const fileList = buildGraph('./kargerMinCut.txt'); 

console.log(fileList);


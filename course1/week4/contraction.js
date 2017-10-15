/* Random Contraction Algorithm */

/* Pseudocode:
 * While there are more than 2 vertices:
 *  - Pick a remaining edge (u, v) uniformly at randomly
 *  - Merge (or "contract") `u` and `v` into a single vertex
 *  - Remove self-loops
 *
 * Return cut represented by 2 final vertices - This is the minimum cut!
*/

function contraction(aList) {
  const newAdj = {};
  Object.assign(newAdj, aList); // Make copy of adjacency list 
  let numVertices = getVertices(newAdj).length;

  while (numVertices > 2) {
    // Get random vertex and edge
    const vertex = getRandomVertex(newAdj);
    const edge = getRandomEdge(newAdj, vertex);

    // Combine vertices' edges into one
    newAdj[vertex] = newAdj[vertex].concat(newAdj[edge]);
    const edgeIndex = newAdj[vertex].indexOf(edge);
    newAdj[vertex].splice(edgeIndex, 1);

    // Remove old and add new vertex from each adjacent vertex
    newAdj[edge].forEach(e => {
      const index = newAdj[e].indexOf(edge);
      if (index !== -1) {
        newAdj[e].splice(index, 1);
        newAdj[e].push(vertex);
      }
    });

    // Remove old vertex from adjacency list
    delete newAdj[edge];

    // Remove self-loops if existing
    newAdj[vertex] = newAdj[vertex].filter(e => e !== vertex); 

    numVertices--;
  }
  return newAdj;
}

/* Helper functions */
const {GraphPrototype, buildGraphFromFile} = require('./graph');

const getVertices = (list) => Object.keys(list);
const getRandomArrEntry = (arr) => arr[Math.floor(Math.random() * arr.length)];
const getRandomVertex = (list) => getRandomArrEntry(getVertices(list));
const getRandomEdge = (list, vertex) => getRandomArrEntry(list[vertex]);
const cutLength = (list) => list[Object.keys(list)[0]].length;
const findMinCut = (file, iterations) => {
  let min = Number.MAX_SAFE_INTEGER;
  for (let i = 0; i < iterations; i++) {
    const newGraph = buildGraph(file);
    min = Math.min(cutLength(contraction(newGraph)), min);
  }
  return min;
}

/* Problem */
console.log(findMinCut('./kargerMinCut.txt', 1000));

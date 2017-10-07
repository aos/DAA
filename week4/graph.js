// Graph implementation

module.exports = function Graph() {
  const vertices = [];
  const adjList = {};

  this.addVertex = function(v) {
    vertices.push(v);
    adjList[v] = [];
  }

  this.addEdge = function(v, w) {
    adjList[v].push(w);
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

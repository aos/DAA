// Queue implementation

module.exports = function Queue() {
  const q = [];

  this.enqueue = function(element) {
    q.push(element);
    return 0;
  }

  this.dequeue = function() {
    return q.shift();
  }

  this.peek = function() {
    return (q[0] ? q[0] : null);
  }

  this.xray = function() {
    let s = '';
    for (let i = 0; i < q.length; i++) {
      s += q[i]; 
    }
    return s;
  }

  this.isEmpty = function() {
    return q.length === 0;
  }

  this.size = function() {
    return q.length;
  }
}

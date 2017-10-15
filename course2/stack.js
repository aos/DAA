// Stack implementation (used for DFS)

module.exports = function Stack() {
  const s = [];

  this.push = function(element) {
    s.push(element);
    return 0;
  }

  this.pop = function() {
    return (!this.isEmpty() ? s.pop() : null);
  }

  this.peek = function() {
    return (!this.isEmpty() ? s[0] : null);
  }

  this.isEmpty = function() {
    return s.length === 0;
  }

  this.size = function() {
    return s.length;
  }
}

# Distances defined implicitly
# Nodes are defined as 24 bits, eg (node 2):
# "0 1 1 0 0 1 1 0 0 1 0 1 1 1 1 1 1 0 1 0 1 1 0 1"
#
# - What is the largest value of 'k' such that there is a 'k'-clustering with
#   spacing at least 3? 
# - That is, how many clusters are needed to ensure that no pair of nodes with all
#   but 2 bits in common get split into different clusters?
#
# Hint: Is there some way you can identify the smallest distances without
# explicitly looking at every pair of nodes?
def hamming(u, v)
  raise ArgumentError.new('Must be the same length') if u.length != v.length
  v = v.split(' ')
  u = u
    .split(' ')
    .select
    .with_index { |c, i| c != v[i] }
    .length
end

require 'digest'

# Hash table implementation
#
# @author Aos
# Initialize with number of buckets, preferably a prime # that is some constant
# factor of the number of objects that will be stored in the table
class HashTable
  include Enumerable

  # Node used to contain each item in the hash table, has a 'next' value which
  # will point to the next node in the list (uses separate chaining strategy for
  # collision resolution)
  #
  # @!attribute [r] Value that will be stored in the node
  # @!attribute [rw] Pointer to next node
  class Node
    attr_reader :val
    attr_accessor :next

    # Create a new instance of node
    #
    # @param Sets the value of the node
    def initialize(n)
      @val = n
      @next = nil
    end
  end

  # Create a new instance of the hash table
  #
  # @param [Integer] Number of buckets that will be created, pref prime #
  def initialize(l)
    @l = l
    @table = Array.new(l)
  end

  # Insert a value into the hash table. This will create a node for this value
  # and insert it at the head of the bucket/list
  #
  # @param Value to be inserted into table
  def insert(n)
    node = Node.new(n)
    hash_val = hash(n)
    current = @table[hash_val]

    if current
      node.next = current
      @table[hash_val] = node
    else
      @table[hash_val] = node
    end
  end

  # Check for existence of value in the hash table
  # 
  # @param Value to look up
  # @return [Boolean]
  def lookup(n)
    current = @table[hash(n)]

    while current
      return true if current.val == n
      current = current.next
    end
    false
  end

  # Defines 'each' method on hash table. Allows for yielding all nodes down the
  # bucket chain (if they exist)
  def each
    if block_given?
      @table.each do |curr|
        while curr
          yield curr
          curr = curr.next
        end
      end
    else
      return @table.each
    end
  end

  private

  # Hash function to 'bucket-ize' our value. Uses SHA-1 (cuz I'm lazy) and mods
  # it by the number of buckets of our hash table
  #
  # @param Value to hash
  # @return [Integer] Bucket # to store our value
  def hash(n)
    Digest::SHA1.hexdigest(n.to_s).to_i(16).modulo(@l)
  end
end

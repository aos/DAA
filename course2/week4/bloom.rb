require 'digest'
require 'bitarray'

# A Bloom Filter implementation, this is similar to a hash table but uses
# a bit array for super fast lookups and insertions at the cost of a small
# false positive error rate
# 
# Two methods defined: 
# @see #insert 
# @see #lookup
class BloomFilter
  # Initializes our bloom filter with a bit array
  #
  # @param
  #   m: bit array length
  #   k: number of hash functions
  #   h: hash function
  def initialize(m, k)
    @m = m 
    @k = k 
    @bits = BitArray.new(m) # Creates an 'm' bits wide bit array
  end

  # Insert a string into bloom filter
  # This will run all hash functions on the string and flip the bits on
  #
  # @param [String] a string to insert into bloom filter
  # @return [Boolean] always returns true
  def insert(s)
    @k.times do |i|
      @bits[h_i(i, @m, s)] = 1
    end
    true
  end

  # Looks up string in bloom filter
  # Checks to see if all appropriate bits are set by running  the string
  # through all the hash functions
  #
  # @return [Boolean] true if exists, false if it does not
  #   keep in mind there is a small false positive error rate `ε`
  def lookup(s)
    @k.times do |i|
      return false if @bits[h_i(i, @m, s)] == 0
    end
    true
  end
   
  private
  # Our randomized hash functions,
  # `mod`-ing the digest by the length of the bit array
  #
  # @private
  # @param 
  #   i: number of hash function
  #   m: length of bit array
  #   s: string to be hashed
  # @return [Integer] Bucket in vector to store our string
  def h_i(i, m, s)
    sha256 = Digest::SHA256.new
    sha256 << s << i.to_s(2) # Ints take a parameter in #to_s for the base
    return sha256.hexdigest.to_i(16).modulo(m)
  end
end

# Min-priority Q
class PriorityQueue
  def initialize
    @items = []
  end

  def enqueue(item, priority)
    ele = Hash[item: item, priority: priority]
    return @items << ele if @items.length == 0

    @items.each_with_index do |item, index|
      if ele[:priority] < item[:priority]
        return @items.insert(index, ele)
      end
    end
    @items << ele
  end

  def dequeue
    raise Exception, 'Empty queue' if @items.length == 0
    @items.shift
  end

  def empty?
    @items.length == 0
  end

  def size
    @items.length
  end

  def print
    @items
  end
end

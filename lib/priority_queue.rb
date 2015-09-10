
require "bin_heap"

class PriorityQueue
  attr_reader :store

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def insert(val, priority)
    @store << [val, priority]
    self.heapify_up(@store.length - 1)
  end

  def extract
    raise "PriorityQueue is empty" if @store.empty?

    value, _ = @store[0]

    if @store.length > 1
      @store[0] = @store.pop
      self.heapify_down(0)
    else
      @store.pop
    end

    value
  end

  def heapify_up(start_idx)
    return true if start_idx == 0

    parent_idx = find_parent(start_idx)

    if @prc.call(@store[start_idx][1], @store[parent_idx][1]) == -1
      @store[start_idx], @store[parent_idx] = @store[parent_idx], @store[start_idx]
      heapify_up(parent_idx)
    else
      return true
    end
  end

  def heapify_down(start_idx)
    children_idx = find_children(start_idx)
    children_idx.select! { |i| i < @store.length }

    return true if children_idx.all? { |i| @prc.call(@store[i][1], @store[start_idx][1]) >= 0 }
  
    if children_idx.length == 1
      temp_idx = children_idx[0] 
    else
      temp_idx = @prc.call(@store[children_idx[0]][1], @store[children_idx[1]][1]) == -1 ? children_idx[0] : children_idx[1]
    end

    @store[temp_idx], @store[start_idx] = @store[start_idx], @store[temp_idx]

    heapify_down(temp_idx)
  end

  def find_parent(idx)
    return false if idx == 0
    return (idx - 1) / 2
  end

  def find_children(idx)
    child_1 = (idx * 2) + 1
    child_2 = (idx * 2) + 2

    return [child_1, child_2].select { |i| i < @store.length }
  end
end
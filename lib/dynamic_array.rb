# dynamic array with ring buffer
class DynamicArray
  attr_accessor :store, :size, :start
  attr_reader :num_items

  def initialize(size)
    @num_items = 0
    @size = size
    @start = 0
    @store = Array.new(size)
  end

  def insert(idx)
  end

  def pop
    @num_items -= 1
    idx = @start + @num_items
    val, @store[idx] = @store[idx], nil

    val
  end

  def push(val)
    resize! if @num_items == @size
    idx = (@start + @num_items) % @size
    @num_items += 1
    @store[idx] = val

    @store
  end

  def remove(idx)
  end

  def shift
    val, @store[@start] = @store[@start], nil
    @num_items -= 1
    @start += 1


    val
  end

  def unshift(val)
    resize! if @num_items == @size
    @start -= 1
    idx = (@start) % @size
    @num_items += 1
    @store[idx] = val

    @store
  end

  private 

  def resize!
    new_size = @size * 2
    new_store = Array.new(new_size)
    old_idx = @start
    new_idx = 0

    until @store.all? { |e| e.nil? }
      new_store[new_idx], @store[old_idx] = @store[old_idx], nil
      new_idx = (new_idx + 1) % @num_items
      old_idx = (old_idx + 1) % @num_items
    end

    @start = 0
    @size = new_size
    @store = new_store
  end
end
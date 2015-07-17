class DynamicArray
  # dynamic array with ring buffer
  attr_accessor :store, :size, :start
  attr_reader :num_items

  def initialize(size)
    @num_items = 0
    @size = size
    @start = 0
    @store = Array.new(size)
  end

  def empty?
    # will refactor to check num_items because I'm not testing that variable right now
    return @store.empty?
  end

  def insert(val, idx)
    # O(n) because you need to copy
    idx += @start
    validate_idx(idx)
    resize! if @num_items == @size

    queue = [val]
    count = 0 # in case @store is full, then @store[idx] will never be nil, 
              # break you move all the way around

    until queue.empty? || count > @num_items
      count += 1
      queue.push(@store[idx]) unless @store[idx].nil?
      @store[idx] = queue.shift
      idx += 1
    end
    @num_items += 1

    @store
  end

  def pop
    # O(1)
    @num_items -= 1
    idx = @start + @num_items
    val, @store[idx] = @store[idx], nil

    val
  end

  def push(val)
    # O(1) ammortized; not called on every push
    resize! if @num_items == @size
    idx = (@start + @num_items) % @size
    @num_items += 1
    @store[idx] = val

    @store
  end

  # def remove(idx)
  #   p "here"
  #   # O(n) because you need to copy
  #   idx += @start
  #   validate_idx(idx)

  #   queue = [@store[idx + 1]]

  #   until queue.empty?
  #     @store[idx] = queue.shift
  #     idx += 1
  #     queue.push(@store[idx]) unless @store[idx].nil?
  #   end

  #   @store
  # end

  def shift
    # O(1)
    val, @store[@start] = @store[@start], nil
    @num_items -= 1
    @start += 1

    val
  end

  def unshift(val)
    # O(1) ammortized; not called on every unshift
    resize! if @num_items == @size
    @start -= 1
    idx = (@start) % @size
    @num_items += 1
    @store[idx] = val

    @store
  end

  private 

  def resize!
    # O(n) because it copies the whole array into new store
    new_size = @size * 2
    new_store = Array.new(new_size)
    old_idx = @start
    new_idx = 0

    @size.times do
      new_store[new_idx], @store[old_idx] = @store[old_idx], nil
      new_idx = (new_idx + 1) % @num_items
      old_idx = (old_idx + 1) % @num_items
    end

    @start = 0
    @size = new_size
    @store = new_store
  end

  def validate_idx(idx)
    raise "invalid index, not in range" if idx < @start || idx > (@start + @num_items - 1)
  end
end
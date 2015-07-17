class ArrayMap
  attr_accessor :store

  def initialize
    @store = []
  end

# O(n)
  def insert(key, value)
    pair = find(key)
    if pair
      pair.last = value
    else
      @store.push([key, value])
    end
  end

# O(n)
  def get(key)
    find(key).last
  end

# O(n)
  def find(key)
    @store.each do |k, v|
      return [k, v] if k == key
    end
    nil
  end

# O(n)
  def remove(key)
    @store.each_with_index do |pair, idx|
       if key == pair.first
         @store.delete_at(idx)
         return true
       end
    end

    false
  end

end

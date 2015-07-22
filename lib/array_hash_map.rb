require_relative 'array_map.rb'
require "byebug"

class ArrayHashMap
  attr_accessor :size, :count, :store

  def initialize(size = 10)
    @size = size
    @store = Array.new(@size) { ArrayMap.new }
    @count = 0
  end

  def insert(key, val)
    self.count += 1
    resize! if self.count == self.size
    get_bucket(key).insert(key, val)
  end

  def get(key)
    get_bucket(key).get(key)
  end

  def find(key)
    get_bucket(key).find(key)
  end

  def remove(key)
    count -= 1
    get_bucket(key).remove(key)
  end

  def key_hash(key)
    key.hash % @size
  end

  def get_bucket(key, buckets = self.store)
    buckets[key_hash(key)]
  end

  def resize!
    self.count = 0
    self.size *= 2
    new_store = Array.new(@size) { ArrayMap.new }
    self.store.each do |bucket|
      bucket.store.each do |k, v|
        self.count += 1
        get_bucket(k, new_store).insert(k, v)
      end
    end
    self.store = new_store
  end
end

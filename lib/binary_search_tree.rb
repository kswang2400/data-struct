require "benchmark"

class BSTNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = EmptyNode.new
    @right = EmptyNode.new
  end

  def insert(val)
    case val <=> value
    when -1 then insert_left(val)
    when 1 then insert_right(val)
    when 0 then false
    end
  end

  def inspect
    " { #{value} : #{left.inspect} | #{right.inspect} } "
  end

  def include?(val)
    case val <=> value
    when -1 then left.include?(val)
    when 1 then right.include?(val)
    when 0 then true
    end
  end

  private

  def insert_left(val)
    left.insert(val) or self.left = BSTNode.new(val)
  end

  def insert_right(val)
    right.insert(val) or self.right = BSTNode.new(val)
  end
end

class EmptyNode
  def include?(*)
    false
  end

  def insert(*)
    false
  end

  def inspect
    "{ }"
  end
end

test_array = []
5000.times { test_array << (rand 5000) }

tree = BSTNode.new(test_array.first)
test_array.each { |v| tree.insert(v) }

Benchmark.bm do |benchmark|
  benchmark.report("test_array include" ) { (1..5000).each { |n| test_array.include? n } }
  benchmark.report("binary tree serach")  { (1..5000).each { |n| tree.include? n } } 
end



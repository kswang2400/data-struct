require "benchmark"

class BSTNode
  attr_reader :value
  attr_accessor :parent, :left, :right, :depth

  def initialize(value)
    @value = value
    @parent = EmptyNode.new
    @left = EmptyNode.new
    @right = EmptyNode.new
    @depth = 1
  end

  def self.balance

  end

  def self.from_array(array)
    BSTNode.new(array.first).tap do |tree|
      array.each { |val| tree.insert(val) }
    end
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

  def to_a
    left.to_a + [value] + right.to_a
  end

  private

  def insert_left(val)
    # left.insert(val) or self.left = BSTNode.new(val)
    if (left.class != EmptyNode)
      left.insert(val)
    else
      new_node = BSTNode.new(val)
      self.left = new_node
      new_node.parent = self
    end
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

  def to_a
    []
  end
end

array = [1, 5, 2, 6, 8, 10, 3]
tree = BSTNode.from_array(array)
p tree
p tree.to_a

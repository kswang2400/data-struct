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

  def update_depth
    @depth = ([left.depth, right.depth].max + 1)
    @parent.update_depth
  end

  private

  def insert_left(val)
    if (left.class != EmptyNode)
      left.insert(val)
    else
      new_node = BSTNode.new(val)
      self.left, new_node.parent = new_node, self
      new_node.update_depth
    end
  end

  def insert_right(val)
    if (right.class != EmptyNode)
      right.insert(val)
    else
      new_node = BSTNode.new(val)
      self.right, new_node.parent = new_node, self
      new_node.update_depth
    end
  end
end

class EmptyNode
  attr_reader :depth

  def initialize
    @depth = 0
  end

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

  def update_depth
    true
  end
end

tree = BSTNode.new(10)
tree.insert(9)
p tree, tree.depth, tree.left.depth, tree.right.depth
tree.insert(8)
p tree, tree.depth, tree.left.depth, tree.right.depth
tree.insert(11)
p tree, tree.depth, tree.left.depth, tree.right.depth
tree.insert(12)
p tree, tree.depth, tree.left.depth, tree.right.depth
tree.insert(13)
p tree, tree.depth, tree.left.depth, tree.right.depth

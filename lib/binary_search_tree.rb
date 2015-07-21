require "benchmark"

class BSTNode
  attr_reader :value
  attr_accessor :parent, :left, :right, :depth, :balance

  def initialize(value)
    @value = value
    @parent = EmptyNode.new
    @left = EmptyNode.new
    @right = EmptyNode.new
    @depth = 1
    @balance = 0
  end

  def rebalance
    if @balance == -2
    elsif @balance == 2
    end
  end

  def self.from_array(array)
    BSTNode.new(array.first).tap do |tree|
      array.each { |val| tree.insert(val) }
    end
  end

  def left_rotate
    new_right = self.right.right
    new_left = BSTNode.new(value)
    new_left.right = right.left
    new_left.left = left
    @value, @left, @right = right.value, new_left, new_right
  end

  def right_rotate
    new_left = self.left.left
    new_right = BSTNode.new(value)
    new_right.left = left.right
    new_right.right = right
    @value, @left, @right = left.value, new_left, new_right
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

  def update_depth_and_balance
    recalculate_depth_and_balance
    rebalance if !([-1, 0, 1].include?(@balance))
    recalculate_depth_and_balance
    @parent.update_depth_and_balance
  end

  private

  def recalculate_depth_and_balance
    @depth = ([left.depth, right.depth].max + 1)
    @balance = right.depth - left.depth
  end

  def insert_left(val)
    if (left.class != EmptyNode)
      left.insert(val)
    else
      new_node = BSTNode.new(val)
      self.left, new_node.parent = new_node, self
      new_node.update_depth_and_balance
    end
  end

  def insert_right(val)
    if (right.class != EmptyNode)
      right.insert(val)
    else
      new_node = BSTNode.new(val)
      self.right, new_node.parent = new_node, self
      new_node.update_depth_and_balance
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

  def update_depth_and_balance
    true
  end
end

tree = BSTNode.new(5)
tree.insert(6)
tree.insert(7)
p tree
tree.insert(8)
p tree
tree.insert(9)
p tree, tree.depth, tree.balance, tree.right.depth, tree.left.depth
tree.insert(10)
p tree, tree.depth, tree.balance, tree.right.depth, tree.left.depth



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

  def self.from_array(array)
    BSTNode.new(array.first).tap do |tree|
      array.each { |val| tree.insert(val) }
    end
  end

  def left_rotate
    new_left = BSTNode.new(value)

    new_right, new_right.parent = self.right.right, self
    new_left.right, new_left.left, new_left.parent = right.left, left, self
    
    @value, @left, @right = right.value, new_left, new_right
  end

  def right_rotate
    new_right = BSTNode.new(value)

    new_left, new_left.parent = self.left.left, self
    new_right.left, new_right.right, new_right.parent = left.right, right, self

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

  def rebalance
    if @balance == -2
      left.left_rotate if left.balance == 1
      right_rotate
    elsif @balance == 2
      right.right_rotate if right.balance == -1
      left_rotate
    end
  end

  def recalculate_depth_and_balance
    @depth = ([left.depth, right.depth].max + 1)
    @balance = right.depth - left.depth
  end
end

class EmptyNode
  attr_reader :depth
  attr_accessor :parent

  def initialize
    @depth = 0
    @parent = nil
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



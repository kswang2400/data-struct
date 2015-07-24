class BinarySearchTree
  attr_accessor :value, :parent, :left, :right, :depth, :balance

  def initialize(value)
    @value = value
    @parent = EmptyNode.new
    @left = EmptyNode.new
    @right = EmptyNode.new
    @depth = 0
    @balance = 0
  end

  def self.from_array(array)
    BinarySearchTree.new(array.first).tap do |tree|
      array.each { |val| tree.insert(val) }
    end
  end

  def left_rotate
    #
    #      A                B
    #     / \              / \
    #    D   B     <=>    A   C
    #       / \          / \
    #      E   C        D   E
    #

    new_left = BinarySearchTree.new(value)   # A'

    new_left.left = left            # A' -> D
    left.parent = new_left          # D  <- A'
    new_left.right = right.left     # A' -> E
    right.left.parent = new_left    # E  <- A'
    new_left.parent = self          # A' <- A

    new_right = right.right         # C
    new_right.parent = self         # C <- A
    
    @value, @left, @right = right.value, new_left, new_right
  end

  def right_rotate
    new_right = BinarySearchTree.new(value)

    new_right.right = right
    right.parent = new_right
    new_right.left = left.right
    left.right.parent = new_right
    new_right.parent = self

    new_left = left.left
    new_left.parent = self

    @value, @left, @right = left.value, new_left, new_right
  end

  def insert(val)
    case val <=> value
    when -1 then insert_at(val, left, -1)
    when 1 then insert_at(val, right, 1)
    when 0 then false
    end

    self
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

  def recalculate_depth_and_balance
    @depth = ([left.depth, right.depth].max + 1)
    @balance = right.depth - left.depth
    # p "RECALULATED DEPTH = #{depth}: BALANCE = #{balance}"
  end

  def update_depth_and_balance
    # recursively update depth and balance, rebalances if needed and crawls up the tree
    recalculate_depth_and_balance
    rebalance if ([-2, 2].include?(@balance))
    # p "RECALULATED #{self.inspect} DEPTH = #{depth}: BALANCE = #{balance}"
    parent.update_depth_and_balance
  end

  private

  def insert_at(val, node, dir)
    # dir: -1 => left, 1 => right
    if (node.class != EmptyNode)
      node.insert(val)
    else
      new_node = BinarySearchTree.new(val)
      (dir == 1) ? self.right = new_node : self.left = new_node
      new_node.parent = self
      new_node.update_depth_and_balance
    end
  end

  def rebalance
    case @balance
    when -2
      left.left_rotate if left.balance == 1
      right_rotate
    when 2
      right.right_rotate if right.balance == -1
      left_rotate
    end

    [right, left, self].each { |n| n.recalculate_depth_and_balance }
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

  def inspect
    "{}"
  end

  def to_a
    []
  end

  def update_depth_and_balance
    true
  end
end
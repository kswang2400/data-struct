class BSTNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
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
    (!!left) ? left.insert(val) : self.left = BSTNode.new(val)
  end

  def insert_right(val)
    (!!right) ? right.insert(val) : self.right = BSTNode.new(val)
  end
end

tree = BSTNode.new(10)
tree.left = BSTNode.new(5)
tree.right = BSTNode.new(15)

p tree
tree.insert(20)
p tree

p tree.include?(10)
p tree.include?(5)
p tree.include?(15)
p tree.include?(20)
# p tree.include?(200)
require "data-struct"

tree = BinarySearchTree.new(10)
tree.insert(5)
tree.insert(1)
tree.insert(7)
tree.insert(11)
tree.insert(2)

def count(tree)
  output = { 0 => 0 }
  count_c(tree, level = 0, output)

  output
end

def count_c(tree, level, output)
  return if children.length == 0
  level += 1
  output[level] += children.length
  children.each { |c| count_c(c, level, output) }
end
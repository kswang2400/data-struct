
require "../lib/binary_search_tree"

test_array = []
5000.times { test_array << (rand 5000) }

tree = BinarySearchTree.new(test_array.first)
test_array.each { |v| tree.insert(v) }
test_hash = Hash[test_array.map { |x| [x, true] }]

Benchmark.bm do |benchmark|
  benchmark.report("test_array include" ) { (1..5000).each { |n| test_array.include? n } }
  benchmark.report("binary tree search")  { (1..5000).each { |n| tree.include? n } } 
  benchmark.report("test_hash lookup ")   { (1..5000).each { |n| test_hash.has_key? n }}
end

count = 0
tree = BinarySearchTree.new(test_array.first)
test_array.each do |v|
  count += 1
  # p count
  # p "#{v}"
  tree.insert(v)
  # p "TREE = #{tree.inspect}"
  # p "DEPTH = #{tree.depth}"
  # p "BALANCE = #{tree.balance}"
end
# p "TREE = #{tree.inspect}"
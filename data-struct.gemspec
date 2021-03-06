Gem::Specification.new do |s|
  s.name        = 'data-struct'
  s.version     = '0.0.10'
  s.date        = '2015-07-16'
  s.summary     = "Data structures, some up and running, not fully tested"
  s.description = "A simple gem that provides several useful implementations of data structures. Contribute at github.com/kswang2400/data-struct"
  s.authors     = ["Kevin Wang", "Daniel Ng", "Conan Tzou", "Karen Ling"]
  s.email       = 'kevinwang2400@gmail.com'
  s.files       = [
                    "lib/bin_heap.rb",
                    "lib/binary_search_tree.rb",
                    "lib/data-struct.rb", 
                    "lib/doubly_linked_list.rb", 
                    "lib/dynamic_array.rb",
                    "lib/max_stack.rb", 
                    "lib/min_max_stack.rb",
                    "lib/singly_linked_list.rb", 
                    "lib/stack_queue.rb"
                  ]
  s.homepage    =
    'http://rubygems.org/gems/data-struct'
  s.license       = 'MIT'
end
# Data Structures

A simple gem that provides several useful data structures.

[![Gem Version](https://badge.fury.io/rb/data-struct.svg)](http://badge.fury.io/rb/data-struct)
<a href="https://codeclimate.com/github/kswang2400/data-struct"><img src="https://codeclimate.com/github/kswang2400/data-struct/badges/gpa.svg" /></a>
<a href="https://codeclimate.com/github/kswang2400/data-struct"><img src="https://codeclimate.com/github/kswang2400/data-struct/badges/gpa.svg" /></a>

##Usage

Install the gem:

```ruby
  gem install data-struct
```

Or require in Gemfile:

```ruby
  gem 'data-struct'
```

then run 

```
  bundle install
```

To use the gem, initialize a new object through the DataStruct module (optional).

```ruby
  linked_list = DataStruct::SinglyLinkedList.new
  # default LinkedList class is doubly linked; use SinglyLinkedList for singly linked list
  dynamic_array = DynamicArray.new(10)
  # same thing, DataStruct module not necessary
```

Class names correspond with list below:

Abstract Data Type          
- [ ] Map                   
- [ ] Set                   
- [x] MaxStack              
- [x] MinMaxStack           
- [ ] Queue                 
                            
Data Structures
- [x] DynamicArray
- [ ] HashMap
- [x] SinglyLinkedList
- [ ] LinkedList
- [ ] LRUCache
- [ ] HashMap
- [x] BinarySearchTree
- [x] BinHeap

## Contents

* [1. Abstract Data Type](#1-abstract-data-type)
  * [1.1 Max Stack](#11-max-stack)
* [2. Data Structures](#2-data-structures)
  * [2.1 Dynamic Array](#21-dynamic-array)
  * [2.2 Singly Linked List](#22-singly-linked-list)
  * [2.3 Binary Search Tree](#23-binary-search-tree-self-balancing)
  * [2.4 Binary Heap](#24-bin-heap)
* [Contact](#contact)
* [Contributing](#contributing)
* [License](#license)

### 1.1 Max Stack

#### #initialize

Initialize your max stack.

```ruby
  max_stack = DataStruct::MaxStack.new
  => #<MaxStack:0x007f86c8a04c80 @store=[]>
```

#### #push(val)

Pushes the value onto the end of the stack

```ruby
  max_stack.store
  => []
  max_stack.push(5)
  => [[5, 5]]
  max_stack.store
  => [[5, 5]]
```

#### #pop

Pops the last element in the stack

```ruby
  max_stack.store
  => [[5, 5]]
  max_stack.pop
  => 5
  max_stack.store
  => []
```

#### #max

Returns in the max value in O(1) time.

```ruby
  max_stack.store
  => [[5, 5], [2, 5], [6, 6], [7, 7]]
  max_stack.max
  => 7
```

### 2.1 Dynamic Array

#### #initialize

Initialize with the size of your dynamic array

```ruby
  d_array = DataStruct::DynamicArray.new(4)
  => #<DynamicArray:0x007ffe5c089460 @num_items=0, @size=4, @start=0, @store=[nil, nil, nil, nil]>
```

#### #pop

Pops the last element in the array

```ruby
  d_array.store
  => [1, 2, 3, 4, nil, nil, nil, nil, nil, nil]
  d_array.pop
  => 4
  d_array.store
  [1, 2, 3, nil, nil, nil, nil, nil, nil, nil]
```

#### #push(val)

Pushes the value onto the end of the array

```ruby
  d_array.store
  => [1, 2, 3, 4, nil, nil, nil, nil, nil, nil]
  d_array.push(10)
  => [1, 2, 3, 4, 10, nil, nil, nil, nil, nil]
```

Resizes when pushed onto full array

```ruby
  d_array.store
  => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  d_array.push(11)
  => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, nil, nil, nil, nil, nil, nil, nil, nil, nil]
```

#### #shift

Shifts and returns the value at the front of the array; doesn't copy the array

```ruby
  d_array.store
  => [1, 2, 3, 4, 10, nil, nil, nil, nil, nil]
  d_array.shift
  => 1
  d_array.store
  => [nil, 2, 3, 4, 10, nil, nil, nil, nil, nil]
```

#### #unshift(val)

Unshifts the value into the front of the array

```ruby
  d_array.store
  => [nil, 2, 3, 4, 5, 6, 7, 8, nil, nil]
  d_array.unshift(100)
  => [100, 2, 3, 4, 5, 6, 7, 8, nil, nil]
```

Uses ring buffer to wrap around

```ruby
  d_array.store
  => [100, 2, 3, 4, 5, 6, 7, 8, nil, nil]
  d_array.unshift(101)
  => [100, 2, 3, 4, 5, 6, 7, 8, nil, 101]
```

#### #insert(val, idx)

Inserts the value at idx and pushes everything over

```ruby
  d_array.store
  => [1, 2, 3, 4, nil, nil, nil, nil, nil, nil]
  d_array.insert(10, 0)
  => [10, 1, 2, 3, 4, nil, nil, nil, nil, nil]
  d_array.insert(100, 2)
  => [10, 1 100, 2, 3, 4, nil, nil, nil, nil]
```

Ring buffer still in effect

```ruby
  d_array.store
  => [100, 2, 3, 4, 5, 6, 7, 8, nil, 101]
  d_array.insert(200, 0)
  => [101, 100, 2, 3, 4, 5, 6, 7, 8, 200]
```

### 2.2 Singly Linked List

#### #initialize

Initialize an empty Linked List object with a sentinel Link

```ruby
  linked_list = DataStruct::SinglyLinkedList.new
  => #<SingleLinkedList:0x007fabbb1af5b8 @sentinel=#<SingleLink:0x007fabbb1af590 @next=nil, @val=nil>>
```
#### #push

Pushes onto the end

```ruby
  linked_list.push(1)
  linked_list.push(2)
  linked_list.push(3)
  => #<SinglyLinkedList:0x007fbe926c7c78 @sentinel=#
      <SinglyLink:0x007fbe926c7c50 @next=#
        <SinglyLink:0x007fbe9262fa90 @next=#
          <SinglyLink:0x007fbe925c68d8 @next=#
            <SinglyLink:0x007fbe91c57540 @next=nil, 
            @val=3>, 
          @val=2>, 
        @val=1>,
     @val=nil>>
```

#### #pop

Pops from the end

```ruby
  linked_list.push(1)
  linked_list.push(2)
  linked_list.push(3)
  linked_list.pop
  => 3
  linked_list.pop
  => 2
```

#### #shift

Shifts from the front

```ruby
  linked_list.push(1)
  linked_list.push(2)
  linked_list.push(3)
  linked_list.shift
  => 1
  linked_list.shift
  => 2
```

#### #unshift

Unshifts into the front of the list

```ruby
  linked_list.unshift(10)
  linked_list.unshift(20)
  linked_list.unshift(30)
  => #<SinglyLinkedList:0x007fbe9256e520 @sentinel=#
      <SinglyLink:0x007fbe9256e5c0 @next=#
        <SinglyLink:0x007fbe924594a0 @next=#
          <SinglyLink:0x007fbe924ba868 @next=#
            <SinglyLink:0x007fbe924ff5d0 @next=nil, 
            @val=10>, 
          @val=20>,
        @val=30>,
     @val=nil>>
```

### 2.2 Singly Linked List

#### #initialize

Initialize an empty Linked List object with a sentinel Link

```ruby
  linked_list = DataStruct::SinglyLinkedList.new
  => #<SinglyLinkedList:0x007fabbb1af5b8 @sentinel=#<SinglyLink:0x007fabbb1af590 @next=nil, @val=nil>>
```

#### #pop

Pops from the end and returns the value

```ruby
  linked_list.push(1)
  linked_list.push(2)
  linked_list.push(3)
  linked_list.pop
  => 3
  linked_list.pop
  => 2
```

#### #push

Pushes onto the end of the list (inner most nested pointer)

```ruby
  linked_list.push(1)
  linked_list.push(2)
  linked_list.push(3)
  => #<SinglyLinkedList:0x007fd349bc2220
      @sentinel=
      #<SinglyLink:0x007fd349bc21f8 @next=
        #<SinglyLink:0x007fd349087b30 @next=
          #<SinglyLink:0x007fd3490b2ce0 @next=
            #<SinglyLink:0x007fd3490cbdf8 @next=nil, 
            @val=3>, 
          @val=2>,
        @val=1>,
      @val=nil>>
```

#### #shift

Shifts from the front and returns the value

```ruby
  linked_list.push(1)
  linked_list.push(2)
  linked_list.push(3)
  linked_list.shift
  => 1
  linked_list.shift
  => 2
```

#### #unshift

unshifts to the front of the list and is attached to the sentinel (outer most pointer)

```ruby
  linked_list.unshift(10)
  linked_list.unshift(20)
  linked_list.unshift(30)
  => #<SinglyLinkedList:0x007fd34a551b38
      @sentinel=
      #<SinglyLink:0x007fd34a551b10 @next=
        #<SinglyLink:0x007fd349bdab18 @next=
          #<SinglyLink:0x007fd34910da28 @next=
            #<SinglyLink:0x007fd348a0e880 @next=nil, 
            @val=10>, 
          @val=20>, 
        @val=30>,
      @val=nil>>
```

### 2.3 Binary Search Tree (self balancing)

#### #initialize 

initialize with your root node

```ruby
  tree = BinarySearchTree.new(10)
  =>  { 10 : {} | {} } 
```

#### #children

// deprecated //

#### ::from_array

class method to initialize tree from an array

```ruby
  tree = BinarySearchTree.from_array([1, 5, 2, 6, 8, 10, 3])
  =>  { 6 :  
        { 2 :  
          { 1 : {} | {} }  |  { 5 :  
                        { 3 : {} | {} }  | {} 
                                }  
        }  |  
        { 8 : {} |  
          { 10 : {} | {} }  
        }  
      }
```

#### #insert(val)

inserts the value in the correct position, then rebalances

```ruby
  tree = BinarySearchTree.new(10)
  tree.insert(15)
  =>  { 10 : {} |  { 15 : {} | {} }  } 
  tree.insert(13)
  =>  { 13 :  { 10 : {} | {} }  |  { 15 : {} | {} }  } 
```

#### #include?(val)

checks tree for presence of value

```ruby
  tree = BinarySearchTree.new(10)
  tree.insert(15)
  tree.include?(15)
  => true
  tree.include?(14)
  => false
```

#### #to_a

returns the tree in sorted array form

```ruby
  tree = BinarySearchTree.from_array([10, 5, 7, 15, 12, 0])
  =>  { 7 :  { 5 :  { 0 : {} | {} }  | {} }  |  { 12 :  { 10 : {} | {} }  |  { 15 : {} | {} }  }  }
  tree.to_a
  => [0, 5, 7, 10, 12, 15]
```

#### benchmark testing

```ruby
  test_array = []
  5000.times { test_array << (rand 5000) }

  tree = BinarySearchTree.new(test_array.first)
  test_array.each { |v| tree.insert(v) }
  test_hash = Hash[test_array.map { |x| [x, true] }]

  Benchmark.bm do |benchmark|
    benchmark.report("test_array include" ) { (1..5000).each { |n| test_array.include? n } }
    benchmark.report("binary tree serach")  { (1..5000).each { |n| tree.include? n } } 
    benchmark.report("test_hash lookup ")   { (1..5000).each { |n| test_hash.has_key? n }}
  end

                        user     system      total        real
  test_array include  0.880000   0.010000   0.890000 (  0.895702)
  binary tree search  0.010000   0.000000   0.010000 (  0.012694)
  test_hash lookup    0.000000   0.000000   0.000000 (  0.001391)

  80x faster than Ruby array, 10x slower than Ruby hash
```

### 2.4 Binary Heap

#### #initialize(&prc)

Initialize the binary heap:

```ruby
  heap = DataStruct::BinHeap.new
  => #<BinHeap:0x007f8e38bc3928 @prc=#<Proc:0x007f8e38bc38b0@lib/bin_heap.rb:6>, @store=[]>
```

Default comparison Proc (MinHeap):

```ruby
  @prc = Proc.new { |el1, el2| el1 <=> el2 }
```

#### #insert(element)

Insert a element into the heap, which will be placed in the correct position via ::heapify_up

```ruby
  bin_heap.insert(4)
  bin_heap.insert(3)
  bin_heap.insert(6)
  bin_heap.insert(0)
  bin_heap.insert(5)
  bin_heap.insert(2)

  bin_heap.store 
  => [0, 3, 2, 4, 5, 6]
```

#### #extract

Removes the element with the highest priority and re-organizes the binary heap accordingly via ::heapify_down

```ruby
  bin_heap.extract
  => 0

  bin_heap.store
  => [2, 3, 6, 4, 5]
```

#### ::heapify_up(store, child_idx, &prc)

1. Starts with the last element, store[child_idx], and compares it to its parent to see if priority holds. 
2. If it does, the binary heap is ordered properly. 
3. If it does not, swap the child and parent elements, and call ::heapify_up recursively until the binary heap is ordered. 

#### ::heapify_down(store, parent_idx, &prc)

1. Starts with the first element and compares it to its children to see if priority holds
2. If it does, the binary heap is ordered properly 
3. If it does not, swap with the child of higher priority if applicable and call ::heapify_down recursively until the heap is ordered. 

#### ::find_children(last_idx, parent_idx)

Due to the nature of a binary heap being a full tree, we can find children indices using a parent_idx by using some arithmetic: 

```ruby
  left_child_idx = (parent_idx * 2) + 1
  right_child_idx = (parent_idx * 2) + 2
``` 

#### ::find_parent(child_idx)

Similary to ::find_children, we can find a child's parent by solving for parent_idx. 

```ruby
  parent_idx = (child_idx - 1) / 2
```

##Contact

* [Aaron Hong](https://github.com/gnoha)
* [Karen Ling](https://github.com/karenling)
* [Daniel Ng](https://github.com/danielng09)
* [Conan Tzou](https://github.com/conanza)
* [Kevin Wang](https://github.com/kswang2400)

##Contributing

* Fork it ( https://github.com/kswang2400/data-structures.git )
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Add some feature')
* Push to the branch (git push origin my-new-feature)
* Create new Pull Request

##License

This code is free to use under the terms of the MIT license. © 2015
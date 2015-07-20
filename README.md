# Data Structures

A simple gem that provides several useful data structures including the following:

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
- [ ] \(doubly\) LinkedList
- [ ] LRUCache
- [ ] HashMap
- [ ] Heap
- [ ] BinarySearchTree

http://www.rubydoc.info/github/kswang2400/data-struct/master/BSTNode

##Usage

Install the gem:

```ruby
  gem install data-struct
```

Or require in Gemfile:

```ruby
  gem 'data-struct'
```

To use the gem, initialize a new object through the DataStruct module

```ruby
  linked_list = DataStruct::SinglyLinkedList.new
  # default LinkedList class is doubly linked list; use SinglyLinkedList for singly linked list
  dynamic_array = DataStruct::DynamicArray.new(10)
```

Class names correspond with list above. Methods detailed below

## Contents

* [1. Data Structures](#1-data-structures)
  * [1.1 Dynamic Array](#11-dynamic-array)
  * [1.2 Singly Linked List](#12-singly-linked-list)
  * [1.3 Max Stack](#13-max-stack)
* [Contact](#contact)
* [Contributing](#contributing)
* [License](#license)

### 1.1 Dynamic Array

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

### 1.2 Singly Linked List

#### #initialize

Initialize an empty Linked List object with a sentinel Link

```ruby
  linked_list = DataStruct::SinglyLinkedList.new
  => #<SingleLinkedList:0x007fabbb1af5b8 @sentinel=#<SingleLink:0x007fabbb1af590 @next=nil, @val=nil>>
```
#### #push

Pushes onto the end

NOTHING HERE TO SEE :)

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

NOTHING HERE TO SEE :)

### 1.3 Max Stack

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

##Contact

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

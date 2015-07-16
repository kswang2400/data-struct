# Data Structures

* static arrays
* dynamic arrays
* hash map
* singly linked list
* doubly linked list
* queue
* stack
* LRU cache
* heaps
* binary search tree

##Usage

Install the gem:

```ruby
  gem install data-struct
```

Or require in Gemfile:

```ruby
  gem 'data-struct'
```

To use the gem, initialize a new object through DataStruct

```ruby
  linked_list = DataStruct.LinkedList
  dynamic_array = DataStruct.DynamicArray(10)
```

Methods detailed below

## Contents

* [1. Data Structures](#1-data-structures)
  * [1.1 Dynamic Array](#11-dynamic-array)

## 1 Data Structures 

### 1.1 Dynamic Array

#### #initialize

Initialize with the size of your dynamic array

```ruby
  d_array = DataStruct.DynamicArray.new(4)
  => #<DynamicArray:0x007ffe5c089460 @num_items=0, @size=10, @start=0, @store=[nil, nil, nil, nil]>
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

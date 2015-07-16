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

#### #Initialize

Initialize with the size of your dynamic array

```ruby
  d_array = DataStruct.DynamicArray.new(10)
  => #<DynamicArray:0x007ffe5c089460 @num_items=0, @size=10, @start=0, @store=[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]>
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

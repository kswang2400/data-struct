require 'dynamic_array'

dynamic_array = DynamicArray.new(10)

p dynamic_array

p dynamic_array.push(1)
p dynamic_array.push(2)
p dynamic_array.push(3)
p dynamic_array.push(4)
p dynamic_array.push(5)
p dynamic_array.push(6)
p dynamic_array.push(7)
p dynamic_array.push(8)


p dynamic_array.shift
p dynamic_array.store

p dynamic_array.unshift(100)
p dynamic_array.unshift(101)

p dynamic_array.insert(200, 0)

p dynamic_array.remove(0)
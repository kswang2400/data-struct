require "min_max_stack"

class MinMaxQueue
  def initialize
    @in, @out = MinMaxStack.new, MinMaxStack.new
  end

  # O(1)
  def push(val)
    @in.push(val)
  end

  # O(1) amortized
  def shift
    flip! if @out.length == 0

    @out.pop
  end

  # O(1)
  def max
    return @in.max if @out.length == 0
    return @out.max if @in.length == 0

    @in.max > @out.max ? @in.max : @out.max
  end

  # O(1)
  def min
    return @in.min if @out.length == 0
    return @out.min if @in.length == 0

    @in.min < @out.min ? @in.min : @out.min
  end

  def flip!
    @in.length.times { @out.push(@in.pop) }
  end
end

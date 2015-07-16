class StackQueue

  attr_reader :in, :out
  def initialize
    @in, @out = [], []
  end

  # O(1) ammortized
  def push(val)
    @in << val
  end

  # WC: O(n)
  def shift
    if @out.empty?
      flip!
    end

    @out.pop
  end

  # O(n)
  def flip!
    @in.length.times do
      @out << @in.pop
    end
  end
end

stack = StackQueue.new
stack.push(4)
stack.push(7)
p stack.shift
p stack

class MinMaxStack
  def initialize
    @store = []
  end

  def max
    @store.empty? ? nil : @store[-1][2]
  end

  def min
    @store.empty? ? nil : @store[-1][1]
  end

  def pop
    val, _ = @store.pop

    val
  end

  def push(val)
    if @store.empty?
      @store << [val, val, val]
    else
      @store << [val, [self.min, val].min, [self.max, val].max]
    end
  end
end

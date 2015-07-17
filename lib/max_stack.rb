class MaxStack
  attr_reader :store

  def initialize
    @store = []
  end

  def push(val)
    if @store.empty?
      @store << [val, val]
    else
      max_val = [val, self.max].max
      @store << [val, max_val]
    end
  end

  def pop
    @store.pop[0]
  end

  def max
    @store[-1][1]
  end
end

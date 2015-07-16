class MinMaxQueue
  def initialize
    @in, @out = [], []
  end

  # O(1)
  def push(val)
    if @in.empty?
      @in << [val, val, val]
    else
      max_val = [val, self.max].max
      min_val = [val, self.min].min
      @in << [val, min_val, max_val]
    end
  end

  # O(1) amortized
  def shift
    flip! if @out.empty?

    @out.pop
  end

  # O(1)
  def max
    return @in[-1][2] if @out.empty?
    return @out[-1][2] if @in.empty?

    if @in[-1][2] > @out[-1][2]
      @in[-1][2]
    else
      @out[-1][2]
    end
  end

  # O(1)
  def min
    return @in[-1][1] if @out.empty?
    return @out[-1][1] if @in.empty?

    if @in[-1][1] < @out[-1][1]
      @in[-1][1]
    else
      @out[-1][1]
    end
  end

  def flip!
    @in.length.times do
      val,_,_ = @in.pop
      if @out.empty?
        @out << [val, val, val]
      else
        max_val = [val, self.max].max
        min_val = [val, self.min].min
        @out << [val, min_val, max_val]
      end
    end
  end
end

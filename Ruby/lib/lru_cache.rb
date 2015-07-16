class LRUCache
  def initialize(max_size, &prc)
    @prc = prc
    @max_size = max_size
    @store = {}
  end

  def calc(input)
    if @store.has_key?(input)
      output = @store.delete(input)
      @store[input] = output
    else
      if @max_size == @store.size
        eject!
      end

      output = @prc.call(input)
      @store[input] = output
    end
p @store
    output
  end

  private

  def eject!
    input, _ = @store.first
    @store.delete(input)
  end
end

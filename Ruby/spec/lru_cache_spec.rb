require "lru_cache"

RSpec.describe LRUCache do
  before :each do
    def fib(n)
      cache = LRUCache.new(10) do |i|
        if i == 1
          0
        elsif i == 2
          1
        else
          cache.calc(i - 2) + cache.calc(i - 1)
        end
      end

      cache.calc(n)
    end
  end

  describe "lru cache" do
    it "returns the correct result" do
      expect(fib(4)).to be(2)
    end
  end
end

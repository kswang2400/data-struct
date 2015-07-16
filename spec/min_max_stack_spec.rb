require "min_max_stack"

RSpec.describe MinMaxStack do
  before :each do
    @mms = MinMaxStack.new
  end


  describe "initialize" do
    it "initializes with an empty array" do
      expect(@mms.store.size).to be(0)
    end
  end

  describe "push" do
    it "sets min and max appropriately for first val in store" do
      @mms.push(4)
      expect(@mms.max).to be(4)
      expect(@mms.min).to be(4)
    end

    it "sets min and max appropriately for subsequent values" do
      @mms.push(4)
      @mms.push(1)
      @mms.push(5)
      expect(@mms.max).to be(5)
      expect(@mms.min).to be(1)
    end
  end

  describe "pop" do
    it "changes max if popped val is the max" do
      @mms.push(4)
      @mms.push(1)
      @mms.push(5)
      @mms.pop
      expect(@mms.max).to be(4)
    end

    it "changes min if popped val is the min" do
      @mms.push(4)
      @mms.push(5)
      @mms.push(1)
      @mms.pop
      expect(@mms.min).to be(4)
    end
  end
end

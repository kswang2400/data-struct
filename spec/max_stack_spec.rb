require "max_stack"

RSpec.describe MaxStack do
  before :each do
    @max_stack = MaxStack.new
  end

  describe "initialize" do
    it "initializes with empty arr" do
      expect(@max_stack.store.count).to be(0)
    end
  end

  describe "push" do
    it "set first val as max" do
      @max_stack.push(3)
      expect(@max_stack.max).to be(3)
    end

    it "doesn't change max val if next val is smaller" do
      @max_stack.push(3)
      @max_stack.push(2)
      expect(@max_stack.max).to be(3)
    end

    it "changes max val if next val is larger" do
      @max_stack.push(3)
      @max_stack.push(5)
      expect(@max_stack.max).to be(5)
    end
  end

  describe "pop" do
    it "changes max val if popped val is max" do
      @max_stack.push(3)
      @max_stack.push(5)
      @max_stack.pop
      expect(@max_stack.max).to be(3)
    end

    it "doesn't change max val if popped val not max" do
      @max_stack.push(3)
      @max_stack.push(5)
      @max_stack.push(4)
      @max_stack.pop
      expect(@max_stack.max).to be(5)
    end
  end
end

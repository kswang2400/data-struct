require "stack_queue"

RSpec.describe StackQueue do
  before :each do
    @stack_queue = StackQueue.new
  end

  describe "push" do
    it "adds val to queue" do
      @stack_queue.push(4)
      expect(@stack_queue.in).to eq([4])
    end
  end

  describe "shift" do
    it "removes first element from queue" do
      @stack_queue.push(4)
      @stack_queue.push(7)
      expect(@stack_queue.shift).to be(4)
      expect(@stack_queue.out).to eq([7])
    end
  end
end

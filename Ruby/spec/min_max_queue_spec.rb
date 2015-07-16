require 'min_max_queue'

RSpec.describe MinMaxQueue do
  before :each do
    @min_max_queue = MinMaxQueue.new
  end

  describe "push" do
    it "sets first val as max" do
      @min_max_queue.push(1)
      expect(@min_max_queue.max).to be(1)
    end

    it "sets first val as min" do
      @min_max_queue.push(1)
      expect(@min_max_queue.min).to be(1)
    end

    it "sets next larger val as max" do
      @min_max_queue.push(1)
      @min_max_queue.push(2)
      expect(@min_max_queue.max).to be(2)
    end

    it "sets next smaller val as min" do
      @min_max_queue.push(1)
      @min_max_queue.push(0)
      expect(@min_max_queue.min).to be(0)
    end
  end

  describe "shift" do
    before :each do
      @min_max_queue.push(1)
      @min_max_queue.push(2)
      @min_max_queue.push(0)
      @min_max_queue.push(5)
      @min_max_queue.push(-5)
    end

    it "sets max" do
      @min_max_queue.shift
      expect(@min_max_queue.max).to be(5)
    end

    it "sets min" do
      @min_max_queue.shift
      expect(@min_max_queue.min).to be(-5)
    end
  end

  describe "shift and push" do
    before :each do
      @min_max_queue.push(1)
      @min_max_queue.push(2)
      @min_max_queue.push(0)
      @min_max_queue.push(5)
      @min_max_queue.push(-5)
      @min_max_queue.shift
    end

    it "sets max after a shift and push" do
      @min_max_queue.push(9)
      expect(@min_max_queue.max).to be(9)
    end

    it "sets min after a shift and push" do
      @min_max_queue.push(-7)
      expect(@min_max_queue.min).to be(-7)
    end
  end
end

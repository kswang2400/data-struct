
require "priority_queue"

describe "Priority Queue" do
  describe "#initialize" do 
    it "initializes correctly" do
      queue = PriorityQueue.new
      expect(queue.store).to be_a(Array)
    end
  end

  context "insert and extract" do
    before :each do
      @queue = PriorityQueue.new
      @queue.insert("first insert", 10)
      @queue.insert("second insert", 20)
      @queue.insert("third insert", 5)
    end

    describe "#insert" do
      it "inserts correctly" do
        @queue.insert("fourth insert", 1)
        expect(@queue.store).to contain_exactly(
          ["first insert", 10],
          ["second insert", 20],
          ["third insert", 5],
          ["fourth insert", 1]
        )
      end
    end

    describe "#extract" do
      it "extracts correctly" do
        value = @queue.extract

        expect(value).to eq "third insert"
        expect(@queue.store).to contain_exactly(
          ["first insert", 10],
          ["second insert", 20]
        )
      end
    end
  end

  context "heapify up and down" do
    before :each do 
      @queue = PriorityQueue.new
      @queue.insert("first insert", 10)
    end

    describe "#heapify_up" do
      it "should heapify up correctly" do
        @queue.insert("second insert", 5)
        expect(@queue.store).to eq [["second insert", 5], ["first insert", 10]]
      end
    end

    describe "#heapify_down" do
      it "should heapify down correctly" do
        @queue.insert("second insert", 20)
        @queue.insert("third insert", 5)
        @queue.insert("fourth insert", 1)

        first = @queue.extract
        second = @queue.extract
        third = @queue.extract
        fourth = @queue.extract

        expect(first).to eq "fourth insert"
        expect(second).to eq "third insert"
        expect(third).to eq "first insert"
        expect(fourth).to eq "second insert"
      end
    end
  end
end
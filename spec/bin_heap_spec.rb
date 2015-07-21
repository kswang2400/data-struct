require 'rspec'
require 'bin_heap'

describe "Heap" do 
  before :each do 
    @heap = BinHeap.new
    @heap.insert(4)
    @heap.insert(3)
    @heap.insert(6)
    @heap.insert(0)
    @heap.insert(5)
    @heap.insert(2)
  end

  describe "#insert" do
    it 'Adds element to the heap' do 
      expect(@heap.store).to contain_exactly(4, 3, 6, 0, 5, 2)
    end

    it 'Heapifies up to order elements such that the parent has a higher priority than the child' do 
      expect(@heap.store).to eq([0, 3, 2, 4, 5, 6])
    end

    it 'Uses comparison given by user' do  
      @heap2 = BinHeap.new do |el1, el2| 
        el2 <=> el1 
      end

      @heap2.insert(4)
      @heap2.insert(3)
      @heap2.insert(6)
      @heap2.insert(2)
      @heap2.insert(5)
      @heap2.insert(7)

      expect(@heap2.store).to eq([7, 5, 6, 2, 3, 4])
    end
  end

  describe "#extract" do  
    it 'Removes the element with the highest priority from the heap' do
      @heap.extract
      expect(@heap.store).to contain_exactly(3, 2, 4, 5, 6)
    end

    it 'Returns the element with the highest priority' do
      expect(@heap.extract).to eq(0)
    end

    it 'Heapifies down to maintain order by priority' do
      @heap.extract
      expect(@heap.store).to eq([2, 3, 6, 4, 5])
    end

    it 'Uses comparison given by user' do
      heap2 = BinHeap.new { |el1, el2| el2 <=> el1 }
      
      heap2.insert(4)
      heap2.insert(3)
      heap2.insert(6)
      heap2.insert(2)
      heap2.insert(5)
      heap2.insert(7)      
      heap2.extract

      expect(heap2.store).to eq([6, 5, 4, 2, 3])
    end
  end

  describe "::heapify_up" do
    it "Orders the heap by priority by taking the inserted element and working up the heap by comparing the element to its parent" do
      @heap.store << 1
      expect(BinHeap.heapify_up(@heap.store, 6)).to eq([0, 3, 1, 4, 5, 6, 2])
    end
  end

  describe "::heapify_down" do 
    it "Orders the heap by placing the last element at the root position working its way down the heap until it meets the priority condition" do
      @heap.store.unshift(3.5)
      expect(BinHeap.heapify_down(@heap.store, 0)).to eq([0, 2, 3, 3.5, 4, 5, 6])
    end
  end

  describe "::find_children" do
    it "Finds the current parent's children" do
      expect(BinHeap.find_children(6, 2)).to eq([5, 6])
    end
  end

  describe "::find_parent" do
    it "Finds the current child's parent" do
      expect(BinHeap.find_parent(3)).to eq(1)
      expect(BinHeap.find_parent(5)).to eq(2)
    end
  end
end
require "binary_search_tree"

RSpec.describe BinarySearchTree do
  before :each do
<<<<<<< HEAD
    @bst = BinarySearchTree.new
  end
end
=======
    @root = BinarySearchTree.new(10)
  end

  describe "#initiailize" do
    it "should initialize with a value" do
      expect(@root.value).to eq 10
    end

    it "should initialize with empty node children" do
      expect(@root.left.class).to be EmptyNode
      expect(@root.right.class).to be EmptyNode
    end
  end

  describe ".from_array" do
    it "should be able to convert an array to a tree" do
      tree = BinarySearchTree.from_array([1, 5, 2, 6, 8, 10, 3])
      expect(tree.value).to eq 6
      expect(tree.left.value).to eq 2
      expect(tree.right.value).to eq 8
    end
  end

  describe "#inspect" do
    it "should make it easier to read tree in terminal" do
      printed_tree = @root.inspect
      expect(printed_tree).to eq " { 10 : {} | {} } "
    end
  end

  describe "#insert" do
    context "should insert values correctly" do
      it "less than its value" do 
        @root.insert(5)
        expect(@root.left.value).to eq 5
        expect(@root.right.class).to eq EmptyNode
      end

      it "greater than its value" do
        @root.insert(15)
        expect(@root.left.class).to eq EmptyNode
        expect(@root.right.value).to eq 15
      end
    end

    context "should be able to insert at multiple levels" do
      it "traverse left" do
        @root.insert(5)
        @root.insert(3)
        @root.insert(1)
        expect(@root.left.left.value).to eq 1
      end

      it "traverse right" do
        @root.insert(15)
        @root.insert(17)
        @root.insert(19)
        expect(@root.right.right.value).to eq 19
      end
    end
  end

  context "filled trees" do
    before :each do 
      @root.insert(5)
      @root.insert(7)
      @root.insert(15)
      @root.insert(12)
      @root.insert(0)
    end

    describe "#include?" do
      it "should return true for found value" do
        expect(@root.include?(5)).to be true
        expect(@root.include?(7)).to be true
        expect(@root.include?(15)).to be true
        expect(@root.include?(12)).to be true
        expect(@root.include?(0)).to be true
      end

      it "should return false for values not in tree" do
        expect(@root.include?(100)).to be false
        expect(@root.include?(11)).to be false
      end
    end

    describe "#to_a" do
      before :each do @array_tree = @root.to_a end

      it "should return the tree in array form" do
        expect(@array_tree).to eq [0, 5, 7, 10, 12, 15]
      end

      it "bonus: should return sorted" do
        sorted_array = [10, 5, 7, 15, 12, 0].sort
        expect(@array_tree).to eq sorted_array
      end
    end
  end

  describe ".update_depth" do
    it "should initialize with depth 1" do
      expect(@root.depth).to eq 0
    end

    it "should update parent's depth" do
      @root.insert(9)
      expect(@root.depth).to eq 2
    end
  end
end



>>>>>>> upstream/master

require "binary_search_tree"

RSpec.describe BSTNode do
  before :each do
    @tree = BSTNode.new(10)
  end

  describe "#initiailize" do
    it "should initialize with a value" do
      expect(@tree.value).to eq 10
    end

    it "should initialize with empty node children" do
      expect(@tree.left.class).to be EmptyNode
      expect(@tree.right.class).to be EmptyNode
    end
  end

  describe ".from_array" do
    it "should be able to convert an array to a tree" do
      tree = BSTNode.from_array([1, 5, 2, 6, 8, 10, 3])
      expect(tree.value).to eq 1
      expect(tree.left.class).to be EmptyNode
      expect(tree.right.value).to eq 5
    end
  end

  describe "#inspect" do
    it "should make it easier to read tree in terminal" do
      printed_tree = @tree.inspect
      expect(printed_tree).to eq " { 10 : { } | { } } "
    end
  end

  describe "#insert" do
    context "should insert values correctly" do
      it "less than its value" do 
        @tree.insert(5)
        expect(@tree.left.value).to eq 5
        expect(@tree.right.class).to eq EmptyNode
      end

      it "greater than its value" do
        @tree.insert(15)
        expect(@tree.left.class).to eq EmptyNode
        expect(@tree.right.value).to eq 15
      end
    end

    context "should be able to insert at multiple levels" do
      it "traverse left" do
        @tree.insert(5)
        @tree.insert(1)
        expect(@tree.left.left.value).to eq 1
      end

      it "traverse right" do
        @tree.insert(15)
        @tree.insert(25)
        expect(@tree.right.right.value).to eq 25
      end
    end
  end

  context "filled trees" do
    before :each do 
      @tree.insert(5)
      @tree.insert(7)
      @tree.insert(15)
      @tree.insert(12)
      @tree.insert(0)
    end

    describe "#include?" do
      it "should return true for found value" do
        expect(@tree.include?(5)).to be true
        expect(@tree.include?(7)).to be true
        expect(@tree.include?(15)).to be true
        expect(@tree.include?(12)).to be true
        expect(@tree.include?(0)).to be true
      end

      it "should return false for values not in tree" do
        expect(@tree.include?(100)).to be false
        expect(@tree.include?(11)).to be false
      end
    end

    describe "#to_a" do
      before :each do @array_tree = @tree.to_a end

      it "should return the tree in array form" do
        expect(@array_tree).to eq [0, 5, 7, 10, 12, 15]
      end

      it "bonus: should return sorted" do
        sorted_array = [10, 5, 7, 15, 12, 0].sort
        expect(@array_tree).to eq sorted_array
      end
    end
  end
end




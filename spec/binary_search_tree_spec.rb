require "binary_search_tree"

RSpec.describe BSTNode do
  before :each do
    @node = BSTNode.new(10)
  end

  describe "#initiailize" do
    it "should initialize with a value" do
      expect(@node.value).to eq 10
    end

    it "should initialize with empty node children" do
      expect(@node.left.class).to be EmptyNode
      expect(@node.right.class).to be EmptyNode
    end
  end
  describe "#insert" do

  end

  describe "#include?" do

  end
end
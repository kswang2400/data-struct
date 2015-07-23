require "binary_search_tree"

RSpec.describe BSTNode do
  before :each do
    @node = BSTNode.new(10)
  end

  describe "#initiailize" do
    it "should initialize with a value" do
      expect(@node.value).to eq 10
    end

    it "should initialize with nil children" do
      expect(@node.left).to be_nil
      expect(@node.right).to be_nil
    end
  end
end
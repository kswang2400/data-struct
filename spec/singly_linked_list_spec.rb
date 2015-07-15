require './singly_linked_list'

RSpec.describe LinkedList do
  before :each do 
    @linked_list = LinkedList.new()
  end

  describe "initialize" do
    it "creates a Linked List" do
      expect(@linked_list.class).to be LinkedList
    end 

    it "initializes with sentinel link" do
      expect(@linked_list.first.class).to be Link
    end
  end

  describe "#push" do
    it "returns self" do
      return_val = @linked_list.push(5)
      expect(return_val).to be @linked_list
    end

    it "pushes a new link into the list" do
      @linked_list.push(1)
      _, last_link = @linked_list.walkthrough
      expect(last_link.val).to eq 1
    end
  end

  describe "#pop" do
    it "returns the last value in the list" do
      @linked_list.push(1)
      @linked_list.push(2)
      @linked_list.push(3)
      @linked_list.push(4)
      pop1 = @linked_list.pop
      pop2 = @linked_list.pop
      expect(pop1).to eq 4
      expect(pop2).to eq 3
    end
  end
end
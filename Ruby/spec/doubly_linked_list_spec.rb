require 'doubly_linked_list'

Rpsec.describe LinkedList do
  before :each do
    @linked_list = LinkedList.new
  end

  describe "initialize" do
    it "creates a Linked List" do
      expect(@linked_list.class).to be LinkedList
    end

    it "initializes with sentinel link" do
      expect(@linked_list.begin_sentinel.class).to be Link
      expect(@linked_list.last_sentinel.class).to be Link
    end
  end

  describe "#push" do
    it "returns self" do
      return_val = @linked_list.push(5)
      expect(return_val).to be @linked_list
    end

    it "pushes a new link into the list" do
      @linked_list.push(1)
      

      expect(@linked_list.last_sentinel.next.val).to eq 1
    end
  end

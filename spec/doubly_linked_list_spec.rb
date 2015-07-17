require 'doubly_linked_list'

RSpec.describe LinkedList do
  before :each do
    @linked_list = LinkedList.new
  end

  describe "initialize" do
    it "creates a Linked List" do
      expect(@linked_list.class).to be LinkedList
    end

    it "initializes with 2 sentinel links" do
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
      val = @linked_list.last_sentinel.prev.val
      expect(val).to be 1
    end
  end

  describe "#unshift" do
    it "returns self" do
      return_val = @linked_list.unshift(5)
      expect(return_val).to be @linked_list
    end

    it "unshifts a new link into the list" do
      @linked_list.unshift(2)
      first_link = @linked_list.begin_sentinel.next
      expect(first_link.val).to be 2
    end
  end

  context "pop and shift" do
    before :each do
      @linked_list.push(1)
      @linked_list.push(2)
      @linked_list.push(3)
      @linked_list.push(4)
    end

    describe "#pop" do
      it "returns the last value in the list" do
        pop1 = @linked_list.pop
        pop2 = @linked_list.pop
        expect(pop1).to eq 4
        expect(pop2).to eq 3
      end
    end

    describe "#unshift" do
      it "returns the first value in the list" do
        shift1 = @linked_list.shift
        shift2 = @linked_list.shift
        expect(shift1).to eq 1
        expect(shift2).to eq 2
      end
    end
  end

end

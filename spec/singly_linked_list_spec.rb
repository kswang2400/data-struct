require "singly_linked_list"

RSpec.describe SinglyLinkedList do
  before :each do 
    @linked_list = SinglyLinkedList.new
  end

  describe "initialize" do
    it "creates a Linked List" do
      expect(@linked_list.class).to be SinglyLinkedList
    end 

    it "initializes with sentinel link" do
      expect(@linked_list.sentinel.class).to be SinglyLink
    end
  end

  describe "#push" do
    it "returns self" do
      return_val = @linked_list.push(5)
      expect(return_val).to be @linked_list
    end

    it "pushes a new link into the list" do
      @linked_list.push(1)
      _, last_link = @linked_list.send(:walkthrough)
      expect(last_link.val).to eq 1
    end
  end

  describe "#unshift" do 
    it "returns self" do
      return_val = @linked_list.unshift(6)
      expect(return_val).to be @linked_list
    end

    it "unshifts a new link into the list" do
      @linked_list.unshift(2)
      first_link = @linked_list.sentinel.next
      expect(first_link.val).to eq 2
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

      it "raises error if list is empty" do
        4.times do 
          @linked_list.pop
        end
        expect{ @linked_list.pop }.to raise_error(RuntimeError, "cannot pop from empty list")
      end
    end

    describe "#shift" do
      it "returns the first value in the list" do
        shift1 = @linked_list.shift
        shift2 = @linked_list.shift
        expect(shift1).to eq 1
        expect(shift2).to eq 2
      end

      it "raises error if list is empty" do
        4.times do 
          @linked_list.shift
        end
        expect{ @linked_list.shift }.to raise_error(RuntimeError, "cannot shift from empty list")
      end
    end
  end
end
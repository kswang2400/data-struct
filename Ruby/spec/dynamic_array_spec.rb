require "dynamic_array"

RSpec.describe DynamicArray do
  before :each do
    @dynamic_array = DynamicArray.new(10)
  end

  describe "initialize" do
    it "initializes with a set size" do
      expect(@dynamic_array.size).to eq 10
    end

    it "initializes with an empty store" do
      expect(@dynamic_array.store.length).to eq 10
    end

    it "initializes with 0 items" do
      expect(@dynamic_array.num_items).to eq 0
    end

    it "initializes with start is at index 0" do
      expect(@dynamic_array.start).to eq 0
    end
  end

  context "push, pop, shift, unshift" do
    before :each do 
      @dynamic_array.push(1)
      @dynamic_array.push(2)
      @dynamic_array.push(3)
      @dynamic_array.push(4)
    end

    describe "#push" do
      it "should push numbers in the back" do
        expect(@dynamic_array.store[0]).to eq 1
        expect(@dynamic_array.store[1]).to eq 2
      end

      it "should correctly update instance variables" do
        expect(@dynamic_array.num_items).to eq 4
        expect(@dynamic_array.size).to eq 10
        expect(@dynamic_array.start).to eq 0
      end
    end

    describe "#pop" do
      before :each do
        @pop1 = @dynamic_array.pop
        @pop2 = @dynamic_array.pop
      end

      it "should return the first value" do
        expect(@pop1).to eq 4
        expect(@pop2).to eq 3
      end

      it "should correctly update instance variables" do
        expect(@dynamic_array.num_items).to eq 2
        expect(@dynamic_array.size).to eq 10
        expect(@dynamic_array.start).to eq 0
      end
    end

    describe "#shift" do
      before :each do 
        @shift1 = @dynamic_array.shift
        @shift2 = @dynamic_array.shift
      end

      it "should remove the first number" do
        expect(@shift1).to eq 1
        expect(@shift2).to eq 2
      end

      it "should correctly update instance variables" do
        expect(@dynamic_array.num_items).to eq 2
        expect(@dynamic_array.size).to eq 10
        expect(@dynamic_array.start).to eq 2
      end
    end

    describe "#unshift" do
      before :each do
        @dynamic_array.unshift(10)
        @dynamic_array.unshift(11)
      end

      it "should add to the front" do
        expect(@dynamic_array.store[@dynamic_array.start]).to eq 11
        @dynamic_array.unshift(12)
        expect(@dynamic_array.store[@dynamic_array.start]).to eq 12
      end

      it "should correctly update instance variables" do
        expect(@dynamic_array.num_items).to eq 6
        expect(@dynamic_array.size).to eq 10
        expect(@dynamic_array.start).to eq(-2)
      end
    end

    context "edge cases with resizing" do
      before :each do 
        @dynamic_array.shift
        @dynamic_array.shift
        p @dynamic_array.store
        (5..16).each do |i|
          @dynamic_array.push(i)
          p @dynamic_array.store
        end
        p @dynamic_array.store

      end

      describe "#resize" do
        it "should have the correct instance variables" do
          expect(@dynamic_array.num_items).to eq 14
          expect(@dynamic_array.size).to eq 20
          expect(@dynamic_array.start).to eq(0)
        end 
      end
    end
  end
end
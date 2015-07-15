require "singly_linked_list"

RSpec.describe Link do 
  before :each do
    @link = Link.new(2)
  end

  describe "initialize" do 
    it "creats instance variables val and next" do
      expect(@link.val).to eq 2
      expect(@link.next).to be_nil
    end
  end
end
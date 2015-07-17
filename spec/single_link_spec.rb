require "single_linked_list"

RSpec.describe SingleLink do 
  before :each do
    @link = SingleLink.new(2)
  end

  describe "initialize" do 
    it "creats instance variables val and next" do
      expect(@link.val).to eq 2
      expect(@link.next).to be_nil
    end
  end
end
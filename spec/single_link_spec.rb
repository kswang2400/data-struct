require "singly_linked_list"

<<<<<<< HEAD
RSpec.describe SingleLink do 
  before :each do
    @link = SingleLink.new(2)
=======
RSpec.describe SinglyLink do 
  before :each do
    @link = SinglyLink.new(2)
>>>>>>> upstream/master
  end

  describe "initialize" do 
    it "creats instance variables val and next" do
      expect(@link.val).to eq 2
      expect(@link.next).to be_nil
    end
  end
end
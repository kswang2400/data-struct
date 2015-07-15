require './singly_linked_list'

RSpec.describe LinkedList do
  before :each do 
    @linked_list = LinkedList.new()
  end


  describe "initialize" do
    it "initializes with empty @first" do
      expect(@linked_list.first).to be_nil
    end
  end
end
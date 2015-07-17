# singly linked list
class SinglyLinkedList
  attr_reader :sentinel

  def initialize
    @sentinel = SingleLink.new(nil)
  end

  def pop
    prev, last = walkthrough
    raise "cannot pop from empty list" if prev.nil?
    prev.next = nil

    last.val
  end

  def push(val)
    link = SingleLink.new(val)
    _, last_link = walkthrough
    last_link.next = link

    self
  end

  def shift
    first_link = @sentinel.next
    raise "cannot shift from empty list" if first_link.nil?
    val = first_link.val
    @sentinel.next = first_link.next

    val
  end

  def unshift(val)
    link = SingleLink.new(val)
    @sentinel.next, link.next = link, @sentinel.next
    
    self
  end

  private

  def walkthrough
    # walksthrough and returns array of second last and last link
    current = @sentinel
    until current.next.nil?
      prev = current
      current = current.next
    end

    [prev, current]
  end
end

class SingleLink
  attr_accessor :next, :val

  def initialize(val)
    @val = val
    @next = nil
  end
end


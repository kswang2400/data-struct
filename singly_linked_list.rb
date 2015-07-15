# singly linked list
class LinkedList
  attr_reader :first

  def initialize
    @first = Link.new(nil)
  end

  def push(val)
    link = Link.new(val)
    last_link = walkthrough
    last_link.next = link
    self
  end

  def pop
    current = @first
    until current.next.nil?
      prev = current
      current = current.next
    end
    prev.next = nil
    current.val
  end

  def unshift(val)
    link = Link.new(val)
    @first, link.next = link, @first
    nil
  end

  def shift
    val = @first.val
    @first = @first.next
    val
  end

  def walkthrough
    # walks through the linked list and returns last link
    current = @first
    until current.next.nil?
      current = current.next
    end
    current
  end
end

class Link
  attr_accessor :next, :val

  def initialize(val)
    @val = val
    @next = nil
  end
end

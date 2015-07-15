# singly linked list
class LinkedList
  attr_reader :first

  def initialize
    @first = Link.new(nil)
  end

  def push(val)
    link = Link.new(val)
    _, last_link = walkthrough
    last_link.next = link

    self
  end

  def pop
    prev, last = walkthrough
    prev.next = nil

    last.val
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
    # walksthrough and returns array of second last and last link
    current = @first
    until current.next.nil?
      prev = current
      current = current.next
    end

    [prev, current]
  end
end

class Link
  attr_accessor :next, :val

  def initialize(val)
    @val = val
    @next = nil
  end
end

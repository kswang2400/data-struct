# singly linked list
class LinkedList
  attr_reader :first

  def initialize
    @first = Link.new(nil)
  end

  def pop
    prev, last = walkthrough
    prev.next = nil

    last.val
  end

  def push(val)
    link = Link.new(val)
    _, last_link = walkthrough
    last_link.next = link

    self
  end

  def shift
    first_link = @first.next
    val = first_link.val
    @first.next = first_link.next

    val
  end

  def unshift(val)
    link = Link.new(val)
    @first, link.next = link, @first
    nil
  end

  private

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

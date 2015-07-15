#singly linked list
#BLAHHHHH
class LinkedList
  attr_reader :first

  def initialize
    @first = nil
  end

  def push(val)
    link = Link.new(val)
    current = @first
    until current.next.nil?
      current = current.next
    end
    current.next = link
    nil
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
end

class Link
  attr_accessor :next, :val

  def initialize(val)
    @val = val
    @next = nil
  end
end

#doubly linked list
class LinkedList
  attr_reader :begin_sentinel, :last_sentinel

  def initialize
    @begin_sentinel = Link.new(nil)
    @last_sentinel = Link.new(nil)
  end

  def pop
    last_link = @last_sentinel.last
    val = last_link.val
    @last_sentinel.prev = last_link.prev

    val
  end

  def push(val)
    link = Link.new(val)
    @last_sentinel.prev.next, link.prev = link, @last_sentinel.prev
    @last_sentinel.prev = link

    self
  end


  def unshift(val)
    link = Link.new(val)
    @begin_sentinel.next.prev, link.next = link, @begin_sentinel.next
    @begin_sentinel.next = link

    self
  end

  def shift
    first_link = @begin_sentinel.next
    val = first_link.val
    @begin_sentinel = first_link.next

    val
  end
end

class Link
  attr_accessor :next, :prev, :val

  def initialize(val)
    @val = val
    @next = nil
    @prev = nil
  end
end

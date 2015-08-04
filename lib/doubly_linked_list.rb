#doubly linked list
class LinkedList
  attr_reader :begin_sentinel, :last_sentinel

  def initialize
    @begin_sentinel = Link.new(nil)
    @last_sentinel = Link.new(nil)
  end

  def pop
    last_link = @last_sentinel.prev
    return nil if last_link == @begin_sentinel

    last_link.prev.next = @last_sentinel
    @last_sentinel.prev = last_link.prev

    last_link.val
  end

  def push(val)
    link = Link.new(val)
    last_link = @last_sentinel.prev
    unless last_link.nil?
      last_link.next, link.prev = link, @last_sentinel.prev
    else
      @begin_sentinel.next = link
    end
    @last_sentinel.prev = link

    self
  end

  def unshift(val)
    link = Link.new(val)
    first_link = @begin_sentinel.next
    unless first_link.nil?
      first_link.prev, link.next = link, first_link
    else
      @last_sentinel.prev = link
    end
    @begin_sentinel.next = link

    self
  end

  def shift
    first_link = @begin_sentinel.next
    return nil if first_link.nil?

    @begin_sentinel.next = first_link.next
    first_link.next.prev = @begin_sentinel

    first_link.val
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

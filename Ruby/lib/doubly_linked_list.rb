<<<<<<< HEAD:singly_linked_list.rb
#singly linked list
#BLAHHHHH
=======
#doubly linked list
>>>>>>> adaa2a2886fc4ed47dda71813a096d513183918d:Ruby/lib/doubly_linked_list.rb
class LinkedList
  def initialize
    @first = nil
    @last = nil
  end

  def push(val)
    link = Link.new(val)
    @last.next, link.prev = link, @last
    @last = link
    nil
  end

  def pop
    val = @last.val
    @last.prev.next = nil
    @last = @last.prev
    val
  end

  def unshift(val)
    link = Link.new(val)
    @first.prev = link
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
  attr_accessor :next, :prev, :val

  def initialize(val)
    @val = val
    @next = nil
    @prev = nil
  end
end

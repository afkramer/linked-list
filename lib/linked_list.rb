require_relative './node'

class LinkedList
  attr_reader :head
  
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      # traverse the list until you reach the element that points to  nil
      curr = @head
      curr = curr.next_node until curr.next_node.nil?
      curr.next_node = new_node
    end
  end

  def prepend(value)
    temp = @head
    @head = Node.new(value)
    @head.next_node = temp
  end

  def size
    size = 0
    return size if @head.nil?

    size += 1
    curr = @head
    until curr.next_node.nil?
      curr = curr.next_node
      size += 1
    end
    size
  end

  def tail
    return nil if @head.nil?

    curr = @head
    curr = curr.next_node until curr.next_node.nil?
    curr
  end

  def at(index)
    return @head if index.zero?

    curr = @head
    index.times do
      curr = curr.next_node
    end
    curr
  end

  def pop
    return if @head.nil?

    prev = nil
    curr = @head
    until curr.next_node.nil?
      prev = curr
      curr = curr.next_node
    end
    prev.next_node = nil
  end
end

ll = LinkedList.new
ll.append('Norma')
ll.append('Sandy')
ll.prepend('Daisy')
ll.prepend('Penny')
ll.tail
ll.pop
ll.tail

#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil


#Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
#Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

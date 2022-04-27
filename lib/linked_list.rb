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

  def contains?(value)
    return false if @head.nil?

    curr = @head
    until curr.next_node.nil?
      return true if curr.value == value

      curr = curr.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?

    curr = @head
    index = 0
    until curr.next_node.nil?
      return index if curr.value == value

      curr = curr.next_node
      index += 1
    end
    nil
  end

  def to_s
    #( value ) -> ( value ) -> ( value ) -> nil
    return 'nil' if @head.nil?

    string = ''
    curr = @head
    until curr.next_node.nil?
      string += "( #{curr.value} ) -> "
      curr = curr.next_node
    end
    string += "( #{curr.value} ) -> nil"
    string
  end
end

ll = LinkedList.new
ll.append('Norma')
ll.append('Sandy')
ll.prepend('Daisy')
ll.prepend('Penny')
ll.to_s

#Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
#Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

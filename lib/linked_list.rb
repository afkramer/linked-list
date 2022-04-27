require_relative './node'

class LinkedList
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
end

ll = LinkedList.new
ll.append('Norma')
ll.append('Sandy')
ll.prepend('Daisy')

#size returns the total number of nodes in the list
#head returns the first node in the list
#tail returns the last node in the list
#at(index) returns the node at the given index
#pop removes the last element from the list
#contains?(value) returns true if the passed in value is in the list and otherwise returns false.
#find(value) returns the index of the node containing value, or nil if not found.
#to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil


#Extra Credit
#insert_at(value, index) that inserts a new node with the provided value at the given index.
#remove_at(index) that removes the node at the given index.
#Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.

require_relative './node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def traverse
    return { prev: nil, curr: nil } if @head.nil?

    prev = nil
    curr = @head
    until curr.next_node.nil?
      yield if block_given?
      prev = curr
      curr = curr.next_node
    end
    yield if block_given?
    { prev: prev, curr: curr }
  end

  def step(index)
    return { prev: nil, curr: nil } if @head.nil? || index > size - 1

    prev = nil
    curr = @head
    index.times do
      prev = curr
      curr = curr.next_node
    end
    { prev: prev, curr: curr }
  end

  def append(value)
    new_node = Node.new(value)
    end_of_list = traverse
    end_of_list.nil? ? @head = new_node : end_of_list.next_node = new_node
  end

  def prepend(value)
    temp = @head
    @head = Node.new(value)
    @head.next_node = temp
  end

  def size
    size = 0
    traverse { size += 1}
    size
  end

  def tail
    traverse
  end

  def at(index)
    step(index)[:curr]
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

  def insert_at(value, index)
    node = Node.new(value)
    hash = step(index)

    return nil if hash[:prev].nil? && hash[:curr].nil? && index != 0

    hash[:prev].nil? ? @head = node : hash[:prev].next_node = node
    node.next_node = hash[:curr]
  end

  def remove_at(index)
    hash = step(index)

    return nil if hash[:prev].nil? && hash[:curr].nil? && index != 0

    if hash[:prev].nil?
      @head = hash[:curr].next_node
    else
      hash[:prev].next_node = hash[:curr].next_node
    end
  end
end

ll = LinkedList.new
ll.append('Norma')
ll.append('Sandy')
ll.append('Noelle')
ll.prepend('Daisy')
ll.prepend('Penny')
ll.insert_at('Spooky3', 4)
ll.size

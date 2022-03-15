# frozen_string_literal: true

# LinkedList class that contains the whole linked list
class LinkedList
  attr_accessor :data, :head, :tail

  def initialize
    @head = nil
    @tail = @head
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value,nil)
      @tail = @head
    else  
      @tail.pointer = Node.new(value,nil)
      @tail = @tail.pointer
    end
  end

  def prepend(value)
    curr_head = @head
    @head = Node.new(value,curr_head)
  end

  def to_s
    if @head == @tail 
      puts "( #{@head.data} ) -> nil "
    elsif @head.nil?
      puts " nil "
    else
      curr_node = @head
      while curr_node != @tail
        print "( #{curr_node.data} ) -> "
        curr_node = curr_node.pointer
      end
      puts "( #{@tail.data} ) -> nil"
    end
  end

  def size
    curr_node = @head
    count = 1
    until curr_node.pointer.nil? do
      count += 1
      curr_node = curr_node.pointer
    end
    count
  end

  def at(index)
    return @head if index.zero?

    return 'no such index' if index >= self.size

    curr_node = @head
    while index.positive?
      curr_node = curr_node.pointer
      index -= 1
    end
    curr_node
  end

  def pop
    if @head == @tail
      @head = nil
    else
      curr_node = @head
      while curr_node.pointer != @tail
        curr_node = curr_node.pointer
      end
      @tail = curr_node
      @tail.pointer = nil
    end
  end

  def contains?(value)
    curr_node = @head
    until curr_node.nil?
      return true if curr_node.data == value

      curr_node = curr_node.pointer
    end
    false
  end

  def find(value)
    return nil unless self.contains?(value)

    count  = 0
    curr_node = @head
    until curr_node.nil?
      return count if curr_node.data == value

      curr_node = curr_node.pointer
      count +=1
    end
    nil
  end

  def insert_at(value,index)
    if index.zero? 
      self.prepend(value)
    elsif index >= self.size
      puts "can't put something there"
    else
      node_before = self.at(index-1)
      old_node_at_index = node_before.pointer
      node_before.pointer = Node.new(value, old_node_at_index)
    end
  end

  def remove_at(index)
    if index.zero? 
      @head = @head.pointer
    else 
      node_before = self.at(index-1)
      node_to_remove = node_before.pointer
      node_before.pointer = node_to_remove.pointer
    end
  end
end

# Node class that contains data and a pointer to the next node
class Node
  attr_accessor :data, :pointer

  def initialize(data, pointer) 
    @data = data
    @pointer = pointer
  end

  def to_s
    print "#{@data}  "
  end
end

testic = LinkedList.new
testic.append('bojan')
testic.append('irena')
testic.append('david')
testic.prepend('stojan')
testic.to_s
puts testic.size
puts testic.head
puts testic.tail
puts testic.at(0)
puts testic.at(2)
p testic.contains?('bojan')
p testic.contains?('nil')
p testic.find('bojan')
p testic.find('janko')
testic.insert_at('janko',2)
testic.to_s
testic.insert_at('joško', 0)
testic.to_s
testic.remove_at(2)
testic.to_s
testic.remove_at(0)
testic.to_s

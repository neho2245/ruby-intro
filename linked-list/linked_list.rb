require_relative 'node'
require 'pry-byebug'

class LinkedList

  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil? && @tail.nil?
      @head = new_node
      @tail = new_node
    else
      # move the tail
      @tail.next = new_node
      @tail = @tail.next
    end
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil? && @tail.nil?
      @head = new_node
      @tail = new_node
    else
      # move the head
      new_node.next = @head
      @head = new_node
    end
    @size += 1
  end

  def head
    return head.value unless head.nil?

    nil
  end

  def tail
    return tail.value unless tail.nil?

    nil
  end

  def at(index)
    itterator = @head
    return nil unless index.between?(0, @size - 1)

    (0..(index - 1)).each do
      itterator = itterator.next
    end

    itterator.value
  end

  def pop
    return nil if @head.nil?

    old_head = @head
    @head = @head.next

    # set next to nil just in case we have a random reference left
    old_head.next = nil
    old_head.value
  end

  def contains?(value)
    itterator = @head
    until itterator.nil?
      return true if itterator.value == value

      itterator = itterator.next
    end
    false
  end

  def index(value)
    itterator = @head
    (0..@size - 1).each do |i|
      return i if itterator.value == value

      itterator = itterator.next
    end
    nil
  end

  def to_s
    itterator = @head
    s = ''
    until itterator.nil?
      s += "( #{itterator.value} ) -> "
      itterator = itterator.next
    end
    s += 'nil'
  end

  def insert_at(index, *value)
    return nil unless index.between?(0, @size - 1)

    itterator = @head
    values = *value
    head = nil
    tail = nil

    p values

    (0..index - 1).each do
      itterator = itterator.next
    end

    values.each_with_index do |element, i|
      node = Node.new(element)

      # binding.pry

      tail.next = node unless tail.nil?
      head = node if i.zero?
      tail = node
    end

    tail.next = itterator.next
    itterator.next = head
    @tail = tail.next if index + values.size > @size
    @size += values.size
  end

end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
list.append(4)

list.insert_at(0, 10, 11)

puts list
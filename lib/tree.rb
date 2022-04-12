# frozen_string_literal: true

require_relative 'node'

# This class recreates the functionality of a Binary Search Tree
class BinarySearchTree
  attr_reader :root

  def initialize(array)
    @root = build_BST(quicksort(array.uniq, 0, array.uniq.length - 1))
  end

  # Select a pivot (highest index in a partitioned array) and recursively sort via comparison
  def quicksort(array, low, high)
    if low >= high || low.negative?
      return array
    end

    par = partition(array, low, high)
    quicksort(array, low, par - 1)
    quicksort(array, par + 1, high)
  end

  # Seperates array and determines a partition for the next seperation
  def partition(array, low, high)
    pivot = array[high]
    i = low - 1
    j = low
    for j in low..(high - 1) do
      if array[j] <= pivot
        i += 1
        array[i], array[j] = array[j], array[i]
      end
    end
    i += 1
    array[i], array[high] = array[high], array[i]
    i
  end

  # Takes in a sorted array and constructs a Binary Search Tree
  def build_BST(array)
    return nil if array.empty?

    middle = (array.size - 1) / 2
    root_node = Node.new(array[middle])

    root_node.left = build_BST(array[0...middle])
    root_node.right = build_BST(array[(middle + 1)..-1])

    root_node
  end

  # Insert a value into the BST by recursively comparing against existing children to find a nil pointer
  def insert(value, current)
    return if value == current

    insert_left(value, current) if value < current
    insert_right(value, current) if value > current
  end
 
  def insert_left(value, node)
    node.left ? insert(value, node.left) : node.left = Node.new(value)
  end

  def insert_right(value, node)
    node.right ? insert(value, node.right) : node.right = Node.new(value)
  end


  def find(value, current = @root)
    return nil if current.nil?
    return current.data if current.data == value

    current.data > value ? find(value, current.left) : find(value, current.right)
  end

  # Create a list of all nodes in the BST
  def node_list(current = @root, queue = [], result = [])
    return result if current.nil?
    # Begins at @root of BST, set as current node and put the data at root in array
    node = [current.data]
    # If there is a left pointer originating from the current node, add the left node's value to the result array
    # Add the pointer to the left node to queue
    unless current.left.nil?
      node << "L: #{current.left.data}"
      queue << current.left
    end
    # Same as above but with the right pointer
    unless current.right.nil?
      node << "R: #{current.right.data}"
      queue << current.right
    end
    # Add data for root, left node, and right node (w.r.t. root) to result array
    result << node
    # We already added the data in the root node, so we go down the left path and remove it from our queue
    queue.shift unless result.length == 1
    # Continue procedure with the child node as the new root
    node_list(queue[0], queue, result)


  end
end

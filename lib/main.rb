# frozen_string_literal: true

require_relative 'node'
require_relative 'tree'

tree = BinarySearchTree.new(([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]))
tree.root # => 8
nodes = tree.node_list # => Returns entire BST
nodes.each { |node| puts node.to_s }
tree.find(324) # => 324 (exists)
tree.find(2) # => nil (does not exist)
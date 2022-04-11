# frozen_string_literal: true

# This class holds nodes' values for data and pointer
class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def to_s
    # puts "data: #{@data}, next_node: #{@next_node}"
    puts @data
  end
end

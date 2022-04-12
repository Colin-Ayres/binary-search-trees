# frozen_string_literal: true

# This class holds nodes' values for data and pointer
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @right = right
    @left = left
  end

  def to_s
    @data.to_s
  end
end

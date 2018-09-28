class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value, parent)
    @value = value
    @parent = parent
    @left =  nil
    @right = nil
  end

  def inspect
    value.to_s
  end
end

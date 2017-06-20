class BSTNode
  attr_accessor :left, :right, :value, :parent

  def initialize(value, parent=nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end

  # def insert(new_value)
  #   if new_value <= @value
  #     @left.nil? ? @left = BSTNode.new(new_value) : @left.insert(new_value)
  #   elsif new_value > @value
  #     @right.nil? ? @right = BSTNode.new(new_value) : @right.insert(new_value)
  #   end
  # end
end

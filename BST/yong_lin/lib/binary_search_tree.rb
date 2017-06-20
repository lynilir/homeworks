# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      # refactored into add_child method instead of BSTNode insert
      add_child(@root, value)
    end
  end

  def find(value, tree_node = @root)
    return nil unless tree_node
    if value == tree_node.value
      return tree_node
    elsif value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    target_node = find(value)
    return nil unless target_node
    # target_node = nil if target_node.left.nil? && target_node.right.nil?

    if target_node.left
      max = maximum(target_node.left)
      remove_max_node(max)
      target_node.value = max.value
      target_node.left, target_node.right = max.left, max.right
    elsif target_node.right
      min = minimum(target_node.right)
      remove_min_node(min)
      target_node.value = min.value
      target_node.left, target_node.right = min.left, min.right
    else
      if @root == target_node
        return @root = nil
      else
        target_node.parent.left = nil if target_node.parent.left == target_node
        target_node.parent.right = nil if target_node.parent.right == target_node
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    tree_node.right.nil? ? tree_node : maximum(tree_node.right)
  end

  def minimum(tree_node = @root)
    tree_node.left.nil? ? tree_node : minimum(tree_node.left)
  end

  def depth(tree_node = @root)
    return 0 unless tree_node && (tree_node.left || tree_node.right)
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end

  def is_balanced?(tree_node = @root)
    depth(@root.left) - depth(@root.right) == 0
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return if tree_node.nil?

    in_order_traversal(tree_node.left, arr)
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right, arr)

    arr
  end

  private
  # optional helper methods go here:
  def remove_max_node(tree_node)
    if tree_node.left
      tree_node.parent.right = tree_node.left
    else
      tree_node.parent.right = nil
    end
  end

  def remove_min_node(tree_node)
    if tree_node.right
      tree_node.parent.left = tree_node.right
    else
      tree_node.parent.left = nil
    end
  end

  def add_child(parent_node=@root, value)
    if parent_node.value < value
      if parent_node.right.nil?
        parent_node.right = BSTNode.new(value, parent_node)
      else
        add_child(parent_node.right, value)
      end
    else
      if parent_node.left.nil?
        parent_node.left = BSTNode.new(value, parent_node)
      else
        add_child(parent_node.left, value)
      end
    end
  end
end

# bst = BinarySearchTree.new
# [5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
#   bst.insert(el)
# end

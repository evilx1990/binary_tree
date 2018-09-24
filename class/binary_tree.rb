# module BinTree
  class Node
    attr_accessor :value, :left, :right, :parrent

    def initialize(value)
      @value = value
      @left =  nil
      @rigth = nil
      @parrent = nil
    end
  end

  class Tree
    attr_accessor :root, :count

    def initialize
      @root = nil
      @count = 0
    end

    def insert(value)
      if @root.nil?
        @root = Node.new(value)
        @root.parrent = nil
      else
        tmp = @root
        prnt = nil

        while tmp != nil
          prnt = tmp
          if value < tmp.value
            tmp = tmp.left
          else
            tmp = tmp.right
          end
        end

        if value < prnt.value
          prnt.left = Node.new(value)
          prnt.left.parrent = prnt
        else
          prnt.right = Node.new(value)
          prnt.right.parrent = prnt
        end
      end
      @count += 1
    end

    def remove(value, node = @root)
      return if node.nil?

      if value < node.value
        remove(value, node.left)
      elsif value > node.value
        remove(value, node.right)
      else value.equal?(node.value)
        delete(node)
        @count -= 1
      end
    end

    def traverse(node = @root)
      unless node.nil?
        traverse(node.left) unless node.left.nil?

        puts node.value

        traverse(node.right) unless node.right.nil?
      end
    end

    private

    def delete(node)
      if node.left.nil? && node.right.nil?
        node = nil
      elsif node.right.nil?
        node = node.left
      elsif node.left.nil?
        node = node.right
      else
        node = with_two_child(node)
      end
      node
    end

    def with_two_child(node)
      if node.right.left.nil?
        node.parrent.left = node.right
        node.right.parrent = node.parrent
        node.right.left = node.left
        node.left.parrent = node.right
      else
        min_node = min_node(node.left)
        node.value = min_node.value
        if min_node.parrent.left.equal?(min_node)
          min_node.parrent.left = nil
        end
      end
    end

    def min_node(node)
      return node if node.left.nil? && node.right.nil?
      min_node(node.left) if node.right.nil?
      min_node(node.right)
    end
  end
#end
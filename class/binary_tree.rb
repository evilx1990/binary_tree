module BinTree
  class Node
    attr_accessor :key, :value, :left, :right

    def initialize(key, value)
      @key = key
      @value = value
      @left =  nil
      @right = nil
    end

    def inspect
      'key: ' + key.to_s + ' value: ' + value.to_s
    end
  end

  class Tree
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(key, value)
      @root = insrt!(key, value, @root)
    end

    def remove(key)
      @root = del!(key, @root)
    end

    def find(key, node = @root)
      return nil if node.nil?

      return node.value if key.equal?(node.key)
      val = find(key, node.left) if key < node.key
      val = find(key, node.right) if key > node.key
      val
    end

    def min(node = @root)
      return node if node.left.nil?
      min(node.left)
    end

    def max(node = @root)
      return node if node.right.nil?
      max(node.right)
    end

    def prefix_traverse(node = @root)
      return nil if node.nil?

      puts node.inspect
      prefix_traverse(node.left) unless node.left.nil?
      prefix_traverse(node.right) unless node.right.nil?
    end

    def infix_traverse(node = @root)
      return nil if node.nil?

      infix_traverse(node.left) unless node.left.nil?
      puts node.inspect
      infix_traverse(node.right) unless node.right.nil?
    end

    def postfix_traverse(node = @root) #
      return nil if node.nil?

      postfix_traverse(node.left) unless node.left.nil?
      postfix_traverse(node.right) unless node.right.nil?
      puts node.inspect
    end

    private

    def insrt!(key, value, node)
      if node.nil?
        return Node.new(key, value)
      elsif key < node.key
        node.left = insrt!(key, value, node.left)
      elsif key > node.key
        node.right = insrt!(key, value, node.right)
      else
        node.value = value
      end
      node
    end

    def del!(key, node)
      return nil if node.nil?

      if key > node.key
        node.right = del!(key, node.right)
      elsif key < node.key
        node.left = del!(key, node.left)
      elsif key.equal?(node.key)
        return nil if node.left.nil? && node.right.nil? # Если нет поддеревьев
        return node.left if node.right.nil? # Если есть только левое поддерево
        return node.right if node.left.nil? # Если есть только правое поддерево

        low_left_node = low_node(node.right) # Если есть два поддерева
        node.key = low_left_node.key
        node.value = low_left_node.value
        node.right = del!(low_left_node.key, node.right)
        return node
      end
      node
    end

    def low_node(node)
      node.left.nil? ? node : min(node.left)
    end
  end
end
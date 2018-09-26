# Frozen_string_literal:true

module BinTree
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

  class Tree
    attr_accessor :root

    def initialize
      @root = nil
    end

    def insert(value)
      @root = new_node!(value, @root, nil)
    end

    def remove(value)
      @root = rm_node!(value, @root)
    end

    def navigation
      node = @root

      loop do
        print_node(node)
        str = STDIN.getch.to_s
        node = nxt(str, node) unless @root.nil?

        break if str.eql?('x')
      end
    end

    def infix_traverse(node = @root)
      return nil if node.nil?

      infix_traverse(node.left) unless node.left.nil?
      print node.inspect + ' '
      infix_traverse(node.right) unless node.right.nil?
    end

    private

    def new_node!(value, node, parent)
      return Node.new(value, parent) if node.nil?

      if value < node.value
        node.left = new_node!(value, node.left, node)
      elsif value >= node.value
        node.right = new_node!(value, node.right, node)
      end
      node
    end

    def rm_node!(value, node)
      return nil if value.equal?(node.value) || node.nil?

      if value < node.value
        node.left = rm_node!(value, node.left)
      elsif value > node.value
        node.right = rm_node!(value, node.right)
      end
      node
    end

    def print_node(node)
      system('clear')

      puts 'usage : '
      puts '  [w] - go to parent'
      puts '  [a] - go to left'
      puts '  [d] - go to right'
      puts '  [x] - return'
      puts '---------------------------'

      if !@root.nil?
        puts 'its root' if node.equal?(@root)
        print 'parent: '
        puts node.equal?(@root) ? 'nil' : node.parent.inspect
        puts 'current: ' + node.inspect

        print 'left: '
        print node.left.nil? ? 'empty' : node.left.inspect
        print ' | right: '
        puts node.right.nil? ? 'empty' : node.right.inspect
      else
        puts 'IsEmpty'
      end
    end

    def nxt(str, node)
      case str
      when 'w'
        node.equal?(@root) ? node : node.parent
      when 'a'
        node.left.nil? ? node : node.left
      when 'd'
        node.right.nil? ? node : node.right
      else
        node
      end
    end
  end
end

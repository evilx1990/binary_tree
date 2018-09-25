module BinTree
  class Node
    attr_accessor :value, :left, :right, :parrent

    def initialize(value)
      @value = value
      @left =  nil
      @right = nil
      @parrent = nil
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
    end

    def remove(key)
      @root = rm!(key, @root)
    end

    def rm!(value, node)
      return nil if value.equal?(node.value) || node.nil?

      if value > node.value
        node.right = rm!(value, node.right)
      elsif value < node.value
        node.left = rm!(value, node.left)
      end
      node
    end

    def navigation
      node = @root

      loop do
        system('clear')

        puts 'usage : '
        puts '  w         - go to parrent'
        puts '  a         - go to left'
        puts '  d         - go to right'
        puts '  exit      - return'
        puts '---------------------------'

        if !@root.nil?
          puts "its root\n" if node.equal?(@root)

          print 'parrent: '
          puts node.equal?(@root) ? 'nil' : node.parrent.inspect
          puts 'current: ' + node.inspect

          if node.left.nil? && node.right.nil?
            puts 'left: empty | right: empty'
          elsif node.left.nil?
            puts 'left: empty | right: ' + node.right.inspect
          elsif node.right.nil?
            puts 'left: ' + node.left.inspect + ' | right: empty'
          else
            puts 'left: ' + node.left.inspect + ' | right: ' + node.right.inspect
          end
        else
          puts 'IsEmpty'
        end

        print '>> '
        str = gets.chomp.to_s

        node = case str
               when 'w'
                 node.equal?(@root) ? node : node.parrent
               when 'a'
                 (node.left.nil?) ? node : node.left
               when 'd'
                 (node.right.nil?) ? node : node.right
               else
                 node
               end
        break if str.eql?('exit')
      end
    end

    def infix_traverse(node = @root)
      return nil if node.nil?

      infix_traverse(node.left) unless node.left.nil?
      puts node.inspect
      infix_traverse(node.right) unless node.right.nil?
    end

  end
end
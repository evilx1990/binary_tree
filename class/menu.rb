require_relative './binary_tree.rb'

class Menu
  def initialize
    @tree = BinTree::Tree.new
    @tree.insert(10)
    @tree.insert(8)
    @tree.insert(6)
    @tree.insert(4)
    @tree.insert(2)
    @tree.insert(0)
    @tree.insert(9)
    @tree.insert(7)
    @tree.insert(5)
    @tree.insert(3)
    @tree.insert(1)
    @tree.insert(12)
    @tree.insert(14)
    @tree.insert(16)
    @tree.insert(18)
    @tree.insert(20)
    @tree.insert(11)
    @tree.insert(13)
    @tree.insert(15)
    @tree.insert(17)
    @tree.insert(19)
  end

  def run
    loop do
      system('clear')

      puts '1 - add'
      puts '2 - delete'
      puts '3 - navigation'
      puts '0 - exit'

      choose = gets.to_i

      system('clear')
      case choose
      when 1
        add
      when 2
        delete
      when 3
        navigator
      end
      break if choose == 0
    end
  end

  def add
    print 'enter value: '
    value = gets.chomp.to_i
    @tree.insert(value)
  end

  def delete
    print 'enter value: '
    value = gets.chomp.to_i
    @tree.remove(value)
  end

  def navigator
    @tree.navigation
  end
end

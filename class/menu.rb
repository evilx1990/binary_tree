# frozen_string_literal:true

require_relative './binary_tree.rb'

class Menu
  def initialize
    @tree = BinTree::Tree.new
    test = [10, 8, 6, 4, 2, 9, 7, 5, 3, 1, 12, 14, 16, 18, 20, 11, 13, 15, 17]
    test.each { |it| @tree.insert(it) }
  end

  def run
    loop do
      system('clear')
      puts "1 - add\n2 - delete\n3 - navigation\n4 - print\nx - exit"

      choose = gets.chomp.to_s

      system('clear')
      choice(choose)
      break if choose.eql?('x')
    end
  end

  private

  def choice(choose)
    case choose
    when '1'
      add
    when '2'
      delete
    when '3'
      navigator
    when '4'
      show_all
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

  def show_all
    @tree.infix_traverse
    puts "\npress any key"
    STDIN.getch.to_s
  end
end

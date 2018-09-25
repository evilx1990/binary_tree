# Реализовать класс бинарного дерева с возможностью навигации и тд.
# В кратце в лучших традициях структуры

require_relative './class/binary_tree.rb'

tree = BinTree::Tree.new


tree.insert(5, 5)
tree.insert(6, 5)
tree.insert(7, 5)
tree.insert(8, 5)
tree.insert(9, 5)
tree.insert(4, 5)
tree.insert(3, 5)
tree.insert(2, 5)
tree.insert(1, 5)
tree.insert(2, 6)

puts '---------------'

tree.postfix_traverse
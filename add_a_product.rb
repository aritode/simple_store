# encoding: utf-8
#
# Simple store with Music, Books and Movies
#
# Script for adding store products in /data/products.xml
#

require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music.rb'
require_relative 'book.rb'

XML_FILENAME = 'data/products.xml'

puts 'Какой товар вы хотите добавить?'
product_types = Product.product_types
product_types.each_with_index { |item, idx| puts "#{idx + 1}. #{item}" }

user_type = 0
user_type = STDIN.gets.to_i until user_type.between?(1, product_types.size)

puts 'Укажите стоимость продукта в рублях'
user_price = STDIN.gets.to_i

puts 'Укажите, сколько единиц продукта осталось на складе'
available_quantity = STDIN.gets.to_i

# Create custom product, based on user choice (-1 for correct index in array)
product = product_types[user_type - 1].new(user_price, available_quantity)

product.read_from_console

product.save_to_xml(XML_FILENAME)


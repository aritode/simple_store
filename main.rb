# encoding: utf-8
#
# Simple store with Music, Books and Movies
#

require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music.rb'
require_relative 'book.rb'

user_input = nil
user_cost = 0

XML_FILENAME = 'data/products.xml'

products = Product.read_from_xml(XML_FILENAME)

def is_number?(string)
  true if Float(string) rescue false
end

while user_input != 'q'
  Product.showcase(products)
  user_input = STDIN.gets.chomp

  if user_input != 'q'
    user_input = user_input.to_i if is_number?(user_input)

    if (0..products.size-1).include?(user_input)
      user_cost += products[user_input].buy
    else
      puts 'Такого товара нет. Введите внимательно число, соответствующее товару.'
      puts
    end
  end
end

puts "Спасибо за покупки, с Вас #{user_cost} рублей"

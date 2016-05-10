# encoding: utf-8
#
# Simple store with Music, Books and Movies
#

require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music.rb'
require_relative 'book.rb'

products = []
user_input = nil
user_cost = 0

leon = Movie.new(550, 4)
leon.update(:title => 'Леон', :producer_name => 'Люк Бессон', :year => '1994')
products << leon

tom = Book.new(349, 10)
tom.update(:title => 'Приключения Тома Сойера', :author_name => 'Марк Твен')
products << tom

judas = Music.new(590, 10)
judas.update(:album_name => 'Turbo', :artist_name => 'Judas Priest', :genre => 'Heavy Metal')
products << judas

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

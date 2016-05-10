# encoding: utf-8
#
# Simple store with Music, Books and Movies
#

require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music.rb'
require_relative 'book.rb'

products = []

leon = Movie.new(550, 4)
leon.update(:title => "Леон", :producer_name => "Люк Бессон", :year => "1994")

tom = Book.new(349, 10)
tom.update(:title => "Приключения Тома Сойера", :author_name => "Марк Твен")

judas = Music.new(590, 10)
judas.update(:album_name => "Turbo", :artist_name => "Judas Priest", :genre => "Heavy Metal")

products << leon
products << tom
products << judas

Product.showcase(products)

products[0].buy

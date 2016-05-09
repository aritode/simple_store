# encoding: utf-8
#
# Simple store with Music, Books and Movies
#

require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music.rb'
require_relative 'book.rb'

leon = Movie.new(550, 4)
leon.update(:title => "Леон", :producer_name => "Люк Бессон", :year => "1994")

puts "Фильм Леон все ещё стоит: #{leon.price} руб."

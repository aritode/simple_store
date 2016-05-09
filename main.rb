# encoding: utf-8
#
# Simple store with Music, Book, Movie
#

require_relative 'product.rb'
require_relative 'movie.rb'
require_relative 'music.rb'
require_relative 'book.rb'

leon = Movie.new(550, 4)
puts "Фильм Леон стоит: #{leon.price} руб."

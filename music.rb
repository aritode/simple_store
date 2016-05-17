class Music < Product

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def info
    "Аудио-Диск #{@artist_name} - #{@album_name} (#{@genre})"
  end

  def read_from_console
    puts 'Укажите название альбома'
    @album_name = STDIN.gets.chomp

    puts 'Укажите артиста'
    @artist_name = STDIN.gets.chomp

    puts 'Укажите жанр'
    @genre = STDIN.gets.chomp
  end

  def to_xml
    product = super
    product.add_element('disk', {
        "artist_name" => @artist_name,
        "album_name" => @album_name,
        "genre" => @genre
    })
    product
  end
end

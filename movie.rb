class Movie < Product

  def update(options)
    @title = options[:title]
    @year = options[:year]
    @producer_name = options[:producer_name]
  end

  def info
    "Фильм \"#{@title}\", реж. #{@producer_name} (#{@year})"
  end

  def read_from_console
    puts 'Укажите название фильма'
    @title = STDIN.gets.chomp

    puts 'Укажите год создания фильма'
    @year = STDIN.gets.chomp

    puts 'Укажите имя режиссёра'
    @producer_name = STDIN.gets.chomp
  end

  def to_xml
    product = super
    product.add_element('movie', {
        "title" => @title,
        "director_name" => @producer_name,
        "year" => @year
    })
    product
  end
end

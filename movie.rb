class Movie < Product

  def update(options)
    @title = options[:title]
    @year = options[:year]
    @producer_name = options[:producer_name]
  end

  def info
    "Фильм \"#{@title}\", реж. #{@producer_name} (#{@year})"
  end
end

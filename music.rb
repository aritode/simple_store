class Music < Product

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def info
    "Аудио-Диск #{@artist_name} - #{@album_name} (#{@genre})"
  end
end

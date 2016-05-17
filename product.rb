require 'rexml/document'
include REXML

class Product
  attr_reader :price

  def initialize(price, product_quantity)
    @price = price
    @product_quantity = product_quantity
  end

  # Abstract method
  def update
  end

  # Abstract method
  def info
  end

  def show
    "#{info} - #{price} руб. [осталось: #{@product_quantity}]"
  end

  def self.showcase(products)
    puts 'Что хотите купить?'
    puts
    products.each_with_index { |item, idx| puts "#{idx}: #{item.show}" }
    puts '----------------------------------------'
    puts 'q. Закончить покупки и произвести расчёт'
    puts
  end

  def buy
    if @product_quantity > 0
      puts '***'
      puts "Вы купили товар: #{info}"
      puts '***'
      puts
      @product_quantity -= 1
      price
    else
      puts 'Товар закончился'
      puts
      0
    end
  end

  def self.read_from_xml(file_name)
    xmldoc = open_xml_file(file_name)

    result = []
    product = nil

    XPath.each(xmldoc, "//product") do |product_node|
      price = product_node.attributes["price"].to_i
      quantity = product_node.attributes["amount_available"].to_i

      product_node.each_element("movie") do |e|
        product = Movie.new(price, quantity)
        product.update(
            title: e.attributes["title"],
            year: e.attributes["year"],
            producer_name: e.attributes["director_name"]
        )
      end

      product_node.each_element("book") do |e|
        product = Book.new(price, quantity)
        product.update(
            title: e.attributes["title"],
            author_name: e.attributes["author_name"]
        )
      end

      product_node.each_element("disk") do |e|
        product = Music.new(price, quantity)
        product.update(
            album_name: e.attributes["album_name"],
            artist_name: e.attributes["artist_name"],
            genre: e.attributes["genre"]
        )
      end

      result << product
    end

    result
  end

  def self.product_types
    [Book, Movie, Music]
  end

  # Abstract method
  def read_from_console
  end

  def to_xml
    element = Element.new('product')
    element.attributes["price"] = @price
    element.attributes["amount_available"] = @product_quantity
    element
  end

  def save_to_xml(file_name)
    xmldoc = Product.open_xml_file(file_name)

    file_path = Product.file_check(file_name)
    file = File.new(file_path, "w:UTF-8")
    xmldoc.root.add_element(self.to_xml)
    xmldoc.write(file, 2)
    file.close

    puts 'Продукт успешно добавлен!'
  end

  def self.open_xml_file(file_name)
    file_path = file_check(file_name)

    xmlfile = File.new(file_path, "r:UTF-8")
    xmldoc = Document.new(xmlfile)
    xmlfile.close

    xmldoc
  end

  def self.file_check(file_name)
    file_path = File.dirname(__FILE__) + "/" + file_name
    abort "Файл #{file_name} не найден!" unless File.exist?(file_path)
    file_path
  end
end

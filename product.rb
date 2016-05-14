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
    file_path = File.dirname(__FILE__) + "/" + file_name

    abort "Файл #{file_name} не найден!" unless File.exist?(file_path)

    xmlfile = File.new(file_path, "r:UTF-8")
    xmldoc = Document.new(xmlfile)
    xmlfile.close

    result = []
    product = nil

    XPath.each(xmldoc, "//product") do |product_node|
    # Left for educational purposes
    # xmldoc.elements.each("products/product") do |product_node|
    # xmldoc.root.elements.each("product") do |product_node|
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

    return result
  end
end

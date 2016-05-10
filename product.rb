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
    puts "Что хотите купить?"
    puts
    products.each_with_index { |item, idx| puts "#{idx}: #{item.show}" }
    puts
  end

  def buy
    if @product_quantity > 0
      puts "Вы купили товар: #{info}"
      @product_quantity -= 1
      price
    else
      puts "Товар закончился"
      0
    end
  end
end

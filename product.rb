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
end

class Product
  attr_reader :price

  def initialize(price, product_quantity)
    @price = price
    @product_quantity = product_quantity
  end
end

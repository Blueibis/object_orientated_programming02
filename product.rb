class Product

  attr_accessor :name, :price, :tax_rate

  def initialize(name, price, tax_rate)
    @name = name
    @price = price
    @tax_rate = tax_rate
  end

  def total_price
    total = @price * (1 + @tax_rate)
    total.round(2)
  end

end

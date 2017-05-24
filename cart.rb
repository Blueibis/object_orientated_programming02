require_relative 'product.rb'  # => true

class ShoppingCart
@@products = []                                               # => []
attr_accessor :products, :total_with_tax, :total_without_tax  # => nil

  def initialize
    @total_with_tax = 0     # => 0
    @total_without_tax = 0  # => 0
  end                       # => :initialize

  def self.contents
    @@products       # => [#<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>]
  end                # => :contents

  def add(name, price, tax_rate)
    new_product = Product.new(name, price, tax_rate)  # => #<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>,   #<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>,                                                                            #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>
    @@products << new_product                         # => [#<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>], [#<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>, #<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>], [#<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>, #<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>]
    new_product                                       # => #<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>,   #<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>,                                                                            #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>
  end                                                 # => :add

  def self.remove(name)
    @@products.delete_at(name)  # => #<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>
  end                           # => :remove

  def total_before_tax
    @total_without_tax = 0                 # => 0
    @@products.each do |product|           # => [#<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>]
      @total_without_tax += product.price  # => 899, 908
    end                                    # => [#<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>]
    @total_without_tax                     # => 908
  end                                      # => :total_before_tax

  def total_after_tax
    @total_with_tax = 0                       # => 0
    @@products.each do |product|              # => [#<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>]
      @total_with_tax += product.total_price  # => 1789.01, 1798.46
    end                                       # => [#<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>]
    @total_with_tax                           # => 1798.46
  end                                         # => :total_after_tax
end                                           # => :total_after_tax

ikea = ShoppingCart.new                   # => #<ShoppingCart:0x005626cbbf9df0 @total_with_tax=0, @total_without_tax=0>
ikea.add("Lazyboy", 299, 0.13)            # => #<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>
ikea.add("Bed(sans matress)", 899, 0.99)  # => #<Product:0x005626cbbf4e68 @name="Bed(sans matress)", @price=899, @tax_rate=0.99>
ikea.add("Shoe. yes just one", 9, 0.05)   # => #<Product:0x005626cbbf2e88 @name="Shoe. yes just one", @price=9, @tax_rate=0.05>
ShoppingCart.remove(0)                    # => #<Product:0x005626cbbf75f0 @name="Lazyboy", @price=299, @tax_rate=0.13>
ShoppingCart.contents.inspect             # => "[#<Product:0x005626cbbf4e68 @name=\"Bed(sans matress)\", @price=899, @tax_rate=0.99>, #<Product:0x005626cbbf2e88 @name=\"Shoe. yes just one\", @price=9, @tax_rate=0.05>]"
ikea.total_before_tax                     # => 908
ikea.total_after_tax                      # => 1798.46

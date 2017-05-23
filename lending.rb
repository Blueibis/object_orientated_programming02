class Book
@@on_shelf = []          # => []
@@on_loan = []           # => []
attr_accessor :due_date  # => nil

  def initialize(title, author, isbn)
    @title = title                     # => "number", "farmer", "bluejay"
    @author = author                   # => "me",     "you",    "birdman"
    @isbn = isbn                       # => 12123,    456712,   4227
    @due_date = nil                    # => nil,      nil,      nil
  end                                  # => :initialize

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)  # => #<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>,   #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>,                                                                                       #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>
    @@on_shelf << new_book                    # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>], [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>], [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>, #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>]
    new_book                                  # => #<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>,   #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>,                                                                                       #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>
  end                                         # => :create

  def self.available
    @@on_shelf         # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>, #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>], [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>]
  end                  # => :available
  def self.borrowed
    @@on_loan          # => [#<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=2017-05-30 18:33:28 -0400>]
  end                  # => :borrowed
  def self.browse
    @@on_shelf.sample  # => #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>
  end                  # => :browse

  def self.current_due_date
        date = Time.now                          # => 2017-05-23 18:33:28 -0400
        @due_date = date + (7 * (60 * 60 * 24))  # => 2017-05-30 18:33:28 -0400
  end                                            # => :current_due_date

  # def due_date
  #   due_date = Time.now + (7 * (60 * 60 * 24))  # => 2017-05-30 16:54:17 -0400
  #   due_date.ctime                              # => "Tue May 30 16:54:17 2017"
  # end                                           # => :due_date

  def borrow
    if lent_out? == true                 # => false
      false
    else
      @due_date = Book.current_due_date  # => 2017-05-30 18:33:28 -0400
      @@on_shelf.delete(self)            # => #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=2017-05-30 18:33:28 -0400>
      @@on_loan << self                  # => [#<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=2017-05-30 18:33:28 -0400>]
      true                               # => true
    end                                  # => true
  end                                    # => :borrow

  def return_to_library
    if lent_out? == false         # => false
      false
    else
      @@on_loan.delete(self)      # => #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=2017-05-30 18:33:28 -0400>
      @@on_shelf << self          # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>, #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=2017-05-30 18:33:28 -0400>]
      @due_date = nil             # => nil
      true                        # => true
    end                           # => true
  end                             # => :return_to_library
  def lent_out?
    if @@on_shelf.include?(self)  # => true, true, false, false
      false                       # => false, false
    else
      true                        # => true, true
    end                           # => false, false, true, true
  end                             # => :lent_out?

  def self.overdue
    overdue = []               # => []
    @@on_shelf.each do |book|  # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>, #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>]
      if @due_date < Time.now  # => false, false, false
         overdue << book
      else
      end                      # => nil, nil, nil
    end                        # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>, #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>]
    @@on_loan.each do |book|   # => []
      if @due_date < Time.now
        overdue << book
      else
      end
    end                        # => []
    overdue                    # => []
  end                          # => :overdue
end                            # => :overdue

number = Book.create("number", "me", 12123)         # => #<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>
farming = Book.create("farmer", "you", 456712)      # => #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>
birdy = Book.create("bluejay", "birdman", 0010203)  # => #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>
Book.available                                      # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>, #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>]
Book.browse                                         # => #<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=nil>
birdy.lent_out?                                     # => false
birdy.borrow                                        # => true
Book.available                                      # => [#<Book:0x005643b797e478 @title="number", @author="me", @isbn=12123, @due_date=nil>, #<Book:0x005643b7979b30 @title="farmer", @author="you", @isbn=456712, @due_date=nil>]
Book.borrowed                                       # => [#<Book:0x005643b79754b8 @title="bluejay", @author="birdman", @isbn=4227, @due_date=2017-05-30 18:33:28 -0400>]
birdy.lent_out?                                     # => true
birdy.due_date                                      # => 2017-05-30 18:33:28 -0400
birdy.return_to_library                             # => true
Book.overdue                                        # => []

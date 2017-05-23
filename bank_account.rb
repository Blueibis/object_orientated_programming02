class BankAccount
@@interest_rate = 0.05  # => 0.05
@@accounts = []         # => []

attr_accessor :balance  # => nil

  def initialize
    @balance = 0  # => 0, 0
  end             # => :initialize

  def deposit(amount)
    @balance += amount  # => 200, 1000
  end                   # => :deposit

  def withdraw(amount)
    @balance -= amount  # => 160.0
  end                   # => :withdraw

  def self.create
    new_account = BankAccount.new  # => #<BankAccount:0x00558c7f6fd130 @balance=0>,   #<BankAccount:0x00558c7f6fc1e0 @balance=0>
    @@accounts << new_account      # => [#<BankAccount:0x00558c7f6fd130 @balance=0>], [#<BankAccount:0x00558c7f6fd130 @balance=0>, #<BankAccount:0x00558c7f6fc1e0 @balance=0>]
    new_account                    # => #<BankAccount:0x00558c7f6fd130 @balance=0>,   #<BankAccount:0x00558c7f6fc1e0 @balance=0>
  end                              # => :create

  def self.total_funds
    sum = 0                       # => 0,                                                                                        0,                                                                                             0,                                                                                                 0
    @@accounts.each do |account|  # => [#<BankAccount:0x00558c7f6fd130 @balance=0>, #<BankAccount:0x00558c7f6fc1e0 @balance=0>], [#<BankAccount:0x00558c7f6fd130 @balance=200>, #<BankAccount:0x00558c7f6fc1e0 @balance=1000>], [#<BankAccount:0x00558c7f6fd130 @balance=210.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>], [#<BankAccount:0x00558c7f6fd130 @balance=160.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>]
      sum += account.balance      # => 0, 0, 200, 1200, 210.0, 1260.0, 160.0, 1210.0
    end                           # => [#<BankAccount:0x00558c7f6fd130 @balance=0>, #<BankAccount:0x00558c7f6fc1e0 @balance=0>], [#<BankAccount:0x00558c7f6fd130 @balance=200>, #<BankAccount:0x00558c7f6fc1e0 @balance=1000>], [#<BankAccount:0x00558c7f6fd130 @balance=210.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>], [#<BankAccount:0x00558c7f6fd130 @balance=160.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>]
    sum                           # => 0,                                                                                        1200,                                                                                          1260.0,                                                                                            1210.0
  end                             # => :total_funds

  def self.interest_time
    @@accounts.each do |account|                # => [#<BankAccount:0x00558c7f6fd130 @balance=200>, #<BankAccount:0x00558c7f6fc1e0 @balance=1000>]
      account.balance *= (@@interest_rate + 1)  # => 210.0, 1050.0
    end                                         # => [#<BankAccount:0x00558c7f6fd130 @balance=210.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>]
    @@accounts                                  # => [#<BankAccount:0x00558c7f6fd130 @balance=210.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>]
  end                                           # => :interest_time
end                                             # => :interest_time

my_account = BankAccount.create    # => #<BankAccount:0x00558c7f6fd130 @balance=0>
your_account = BankAccount.create  # => #<BankAccount:0x00558c7f6fc1e0 @balance=0>
my_account.balance                 # => 0
BankAccount.total_funds            # => 0
my_account.deposit(200)            # => 200
your_account.deposit(1000)         # => 1000
BankAccount.total_funds            # => 1200
BankAccount.interest_time          # => [#<BankAccount:0x00558c7f6fd130 @balance=210.0>, #<BankAccount:0x00558c7f6fc1e0 @balance=1050.0>]
my_account.balance                 # => 210.0
your_account.balance               # => 1050.0
BankAccount.total_funds            # => 1260.0
my_account.withdraw(50)            # => 160.0
my_account.balance                 # => 160.0
BankAccount.total_funds            # => 1210.0

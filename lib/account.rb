class Account

attr_reader :transactions
attr_accessor :balance, :deposit

  def initialize(balance = 0, transaction_class = Transaction)
    @balance = balance
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    @deposit = @transaction_class.new("Deposit", amount)
    @transactions << @deposit
  end

  def withdraw(amount)
    raise("Insufficient funds available in account. You have #{@balance} remaining.") if @balance < amount
    @balance -= amount
  end

  def print_balance
    print("Your balance is #{@balance}")
  end
end

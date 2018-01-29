class Account

attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise("Insufficient funds available in account. You have #{@balance} remaining.") if @balance <= amount
    @balance -= amount
  end

  def print_balance
    print("Your balance is #{@balance}")
  end
end

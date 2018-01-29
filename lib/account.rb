class Account

attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise("Insufficient funds available in account. You have #{@balance} remaining.") if @balance <= amount
    @balance -= amount
  end
end

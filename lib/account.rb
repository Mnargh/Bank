class Account

attr_reader :transactions
attr_accessor :balance, :deposit, :withdrawal

  def initialize(balance = 0, transaction_class = Transaction)
    @balance = balance
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @balance += amount
    # increase_balance(amount)
    @deposit = @transaction_class.new("Deposit", amount, Time.new.strftime("%d/%m/%Y") ,@balance)
    @transactions << @deposit
  end

  def withdraw(amount)
    raise("Insufficient funds available in account. You have #{@balance} remaining.") if @balance < amount
    @balance -= amount
    @withdrawal = @transaction_class.new("Withdrawal", amount, Time.new.strftime("%d/%m/%Y") ,@balance)
    @transactions << @withdrawal
  end

  def print_balance
    print("Your balance is #{@balance}")
  end

  def print_statement
    puts "date || credit || debit || balance"
    @transactions.reverse.each do |transaction|
      puts "#{transaction.date} || || #{'%.02f' % transaction.amount} || #{'%.02f' % transaction.balance_after_transaction}" if transaction.type == "Withdrawal"
      puts "#{transaction.date} || #{'%.02f' % transaction.amount} || || #{'%.02f' % transaction.balance_after_transaction}" if transaction.type == "Deposit"
    end
  end

  # private
  #
  # def increase_balance(amount)
  #   @balance += amount
  # end
  #
  # def decrease_balance(amount)
  #   @balance -= amount
  # end


end

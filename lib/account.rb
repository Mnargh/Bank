class Account

attr_reader :transactions, :balance, :deposit, :withdrawal
# attr_accessor

  def initialize(balance = 0, transaction_class = Transaction)
    @balance = balance
    @transactions = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    increase_balance(amount)
    @deposit = @transaction_class.new("Deposit", amount, Time.new.strftime("%d/%m/%Y") ,@balance)
    @transactions.unshift(@deposit)
  end

  def withdraw(amount)
    raise("Insufficient funds available in account. You have #{@balance} remaining.") if @balance < amount
    decrease_balance(amount)
    @withdrawal = @transaction_class.new("Withdrawal", amount, Time.new.strftime("%d/%m/%Y") ,@balance)
    @transactions.unshift(@withdrawal)
  end

  def record_transaction(withdrawn, deposited)
    # potential for refactoring the recording of transactions
  end

  def print_balance
    print("Your balance is #{@balance}")
  end

  def print_statement
    puts "date || credit || debit || balance"
    @transactions.each do |transaction|
      puts "#{transaction.date} || || #{'%.02f' % transaction.amount} || #{'%.02f' % transaction.balance_after_transaction}" if transaction.type == "Withdrawal"
      puts "#{transaction.date} || #{'%.02f' % transaction.amount} || || #{'%.02f' % transaction.balance_after_transaction}" if transaction.type == "Deposit"
      # refactor the formatting of this string in to the transaction class, then do transaction.each do transaction.message for example
    end
  end

  private

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end



end

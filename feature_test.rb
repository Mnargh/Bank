require './lib/account'
require './lib/transaction'

account = Account.new
account.deposit(100)
account.withdraw(50)
account.withdraw(30)
account.print_statement

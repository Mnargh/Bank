require 'date'

class Transaction

  attr_reader :amount, :date, :type, :balance_after_transaction

  def initialize(type, amount, date = Time.new.strftime("%d/%m/%Y"), balance_after_transaction)
    @type = type
    @amount = amount
    @date = date
    @balance_after_transaction = balance_after_transaction
  end
end

require 'date'

class Transaction

  attr_reader :amount, :date

  def initialize(type, amount, date = Time.new.strftime("%d/%m/%Y"))
    @type = type
    @amount = amount
    @date = date
  end
end

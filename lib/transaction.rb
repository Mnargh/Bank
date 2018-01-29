require 'date'

class Transaction

  def initialize(type, amount, date = Date.today)
    @type = type
    @amount = amount
    @date = date
  end
end

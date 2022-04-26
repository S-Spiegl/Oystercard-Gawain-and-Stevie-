class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end
  
  def deduct_money(money)
    @balance -= money
  end

  def touch_in
    true
  end

  def touch_out
    true
  end

  private 
  #single responsibility principle honoured by making max_balance_exceeded method instead of
  #including @balance >= MAX_BALANCE in the fail method above
  def max_balance_exceeded
    @balance >= MAX_BALANCE
  end

end

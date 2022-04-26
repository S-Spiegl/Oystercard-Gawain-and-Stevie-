class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @journey_checker = []
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end

  def deduct_money(money)
    @balance -= money
  end

  def touch_in
    @journey_checker << "on journey"
  end

  def touch_out
    fail "You're not touched in" if @journey_checker.empty?
    @journey_checker.pop
    @journey_checker
  end

  def on_journey?
    @journey_checker
  end

  private
  #single responsibility principle honoured by making max_balance_exceeded method instead of
  #including @balance >= MAX_BALANCE in the fail method above
  def max_balance_exceeded
    @balance >= MAX_BALANCE
  end

end

class Oystercard
  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey_checker = "touched_out"
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end

  def deduct_money(money)
    @balance -= money
  end

  def touch_in
    fail "Insufficient funds" if @balance < MIN_BALANCE
    @journey_checker = "touched_in"
  end

  def touch_out
    fail "You're not touched in" unless on_journey?
    @journey_checker = "touched_out"
  end

  def on_journey?
    @journey_checker == "touched_in"
  end

  private
  #single responsibility principle honoured by making max_balance_exceeded method instead of
  #including @balance >= MAX_BALANCE in the fail method above
  def max_balance_exceeded
    @balance >= MAX_BALANCE
  end

end

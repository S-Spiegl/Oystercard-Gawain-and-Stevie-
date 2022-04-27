class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey_history

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds" if @balance < MIN_BALANCE
    @entry_station = station
    @journey_history << station
  end

  def touch_out(station)
    fail "You're not touched in" unless on_journey?
    deduct_money(MIN_BALANCE)
    @entry_station = nil
    @journey_history << station
  end

  def on_journey?
    @entry_station == nil ? false : true
  end



  private
  #single responsibility principle honoured by making max_balance_exceeded method instead of
  #including @balance >= MAX_BALANCE in the fail method above
  def max_balance_exceeded
    @balance >= MAX_BALANCE
  end

  def deduct_money(money)
    @balance -= money
  end

end
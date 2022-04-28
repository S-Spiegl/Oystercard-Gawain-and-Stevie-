class Oystercard
  #need to write custom accessors to replace attribute readers as per instructions in step 12

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey_history
  attr_reader :current_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
    @current_journey = {entry: nil, exit: nil}
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds" if balance < MIN_BALANCE
    @entry_station = station
    @current_journey[:entry] = station
  end

  def touch_out(station)
    fail "You're not touched in" unless on_journey?
    deduct(MIN_BALANCE)
    @current_journey[:exit] = station
    @journey_history << @current_journey
  end

  def on_journey?
    @entry_station == nil ? false : true
  end

  private
  #single responsibility principle honoured by making max_balance_exceeded method instead of
  #including @balance >= MAX_BALANCE in the fail method above
  def max_balance_exceeded
    balance >= MAX_BALANCE
  end

  def deduct(fare)
    @balance -= fare
  end

end

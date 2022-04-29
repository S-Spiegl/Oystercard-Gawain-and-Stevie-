class Oystercard
  #need to write custom accessors to replace attribute readers as per instructions in step 12

  attr_reader :balance
  #attr_reader :entry_station
  attr_reader :journey_history
  #attr_reader :current_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    #@entry_station = nil
    @journey_history = []
    #@current_journey = {entry: nil, exit: nil}
    @current_journey = Journey.new
  end

  def add_money(money)
    fail "funds cannot be added: maximum balance £#{MAX_BALANCE}" if max_balance_exceeded
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient funds" if balance < MIN_BALANCE
    if @current_journey.entry_station.nil?
    else
      @current_journey.calculate_fare
      deduct(@current_journey.fare)
      @journey_history << @current_journey
      @current_journey = Journey.new
    end
    @current_journey.start_journey(station)
  end

  def touch_out(station)
    @current_journey.end_journey(station)
    @current_journey.calculate_fare
    deduct(@current_journey.fare)
    @journey_history << @current_journey
    @current_journey = Journey.new
  end

  def on_journey?
    #@entry_station == nil ? false : true
    @current_journey.entry_station.nil? ? false : true
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

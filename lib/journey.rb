class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station, :fare

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_station)
    @exit_station = exit_station
  end

  def calculate_fare
    complete? ? @fare = MINIMUM_FARE : @fare = PENALTY_FARE
  end

  def complete?
    @entry_station && @exit_station
  end

end

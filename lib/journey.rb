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
    if @entry_station && @exit_station
      @fare = MINIMUM_FARE
    else
      @fare = PENALTY_FARE
    end
  end



end

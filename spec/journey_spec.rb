require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe '#start_journey' do
    it 'should store an entry station' do
      subject.start_journey(entry_station)
      expect(subject.entry_station).to eq (entry_station)
    end
  end

  describe '#end_journey' do
    it 'should store an exit station' do
      subject.end_journey(exit_station)
      expect(subject.exit_station).to eq (exit_station)
    end
  end

  describe '#calculate_fare' do
    it "should return #{Journey::MINIMUM_FARE} if journey is complete" do
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      subject.calculate_fare
      expect(subject.fare).to eq (Journey::MINIMUM_FARE)
    end

    it "should return #{Journey::PENALTY_FARE} if journey is incomplete" do
      subject.start_journey(entry_station)
      subject.calculate_fare
      expect(subject.fare).to eq (Journey::PENALTY_FARE)
    end
  end
end

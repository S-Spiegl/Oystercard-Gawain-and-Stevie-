require 'station'

describe Station do

  describe '#zone' do
    it 'should have a zone' do
      expect(Station).to respond_to(:new).with(1).argument
    end

    it 'should return zone' do
      zone = 1
      station = Station.new(zone)
      expect(station.zone).to eq(zone)
    end
  end
end

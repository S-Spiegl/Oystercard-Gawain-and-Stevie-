require 'station'

describe Station do
  describe '#new' do
      it 'should have a name and a zone' do
      expect(Station).to respond_to(:new).with(2).argument
    end
  end
  describe '#name' do
    it 'should return name' do
      name = "Burnt Oak"
      zone = 6
      station = Station.new(name, zone)
      expect(station.name).to eq(name)
    end
  end
  describe '#zone' do
    it 'should return zone' do
      name = "Bank"
      zone = 1
      station = Station.new(name, zone)
      expect(station.zone).to eq(zone)
    end
  end
end

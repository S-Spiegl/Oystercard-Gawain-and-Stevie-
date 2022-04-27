require 'oystercard'

describe Oystercard do

  let(:station) { double :station }

  it 'creates an instance of Oystercard' do
    expect(subject).to be_instance_of(Oystercard)
  end

  it "tells user if they are on a journey" do
    subject.add_money(Oystercard::MIN_BALANCE)
    subject.touch_in(station)
    expect(subject.on_journey?).to eq true
  end

  it 'remembers entry station' do
    subject.add_money(1)
    subject.touch_in(station)
    expect(subject.entry_station).not_to eq nil
  end

  describe '# journey_history' do
    it 'records and returns journey history' do
      subject.add_money(Oystercard::MAX_BALANCE)
      3.times { subject.touch_in(station); subject.touch_out }
      expect(subject.journey_history).not_to be_empty
    end
  end

  describe '# add money' do
    it 'responds to add_money with 1 argument' do
      expect(subject).to respond_to(:add_money).with(1).argument
    end

    it 'does not allow user to add more than maximum funds' do
      subject.add_money(90)
      expect { subject.add_money(1) }.to raise_error 'funds cannot be added: maximum balance £90'
    end
  end

  describe '# balance' do
    it 'responds to balance' do
      subject.balance
      expect(subject).to respond_to :balance
    end

    it 'returns balance' do
      expect(subject.balance).to eq(0)
    end
  end
 
  describe '# touch_out' do
    it 'can only touch_out if touched in' do
      expect { subject.touch_out }.to raise_error "You're not touched in"
    end

    it "removes fare from balance" do
      subject.add_money(Oystercard::MIN_BALANCE)
      subject.touch_in(station)
      expect{ subject.touch_out }.to change {subject.balance}.by(-Oystercard::MIN_BALANCE)
    end
  end

  describe "# touch_in" do
    it "refuses entry unless minimum balance is #{Oystercard::MIN_BALANCE}" do
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds"
    end
  end

end

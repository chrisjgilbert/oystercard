require 'oystercard_status'

describe OysterCardStatus do

  let(:oystercard_status) { described_class.new }

  let(:oystercard) { double :oystercard, :in_journey => false }

  describe '#initialize' do
    it 'sets in journey status to false by default' do
      expect(oystercard_status.in_journey).to eq false
    end

    it 'sets the minimum fare to touch in with at a default value of 1' do
      expect(oystercard_status.min_fare).to eq OysterCardStatus::MIN_FARE
    end
  end

  describe '#touch_in' do
    it 'changes oystercard status to in journey' do
      oystercard_status.touch_in(1)
      expect(oystercard_status.in_journey).to eq true
    end

    it 'user can"t touch in with less than £1 in balance' do
      message = 'You dont have suffient balance to touch in'
      expect { oystercard_status.touch_in(0) }.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'changes oystercard status to not in journey' do
      oystercard_status.touch_out
      expect(oystercard_status.in_journey).to eq false
    end
  end

  describe '#in_journey?' do
    it 'allows user to view in journey status' do
      subject.touch_in(1)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end

end

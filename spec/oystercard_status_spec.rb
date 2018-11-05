require 'oystercard_status'

describe OysterCardStatus do

  let(:oystercard) { double :oystercard, :in_journey => false }

  describe '#initialize' do
    it 'sets in journey to false by default' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'changes oystercard status to in journey' do
      oystercard = OysterCard.new
      expect(oystercard.card_status.touch_in).to eq oystercard.card_status
    end
  end

  describe '#touch_out' do
    it 'changes oystercard status to not in journey' do
      oystercard = OysterCard.new
      expect(oystercard.card_status.touch_out).to eq oystercard.card_status
    end
  end

  describe '#in_journey?' do
    it 'allows user to view in journey status' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end



end

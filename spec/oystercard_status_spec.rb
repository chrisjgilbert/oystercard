require 'oystercard_status'

describe OysterCardStatus do

  let(:oystercard) { double :oystercard, :in_journey => false }

  describe '#initialize' do
    it 'sets in journey to false by default' do
      expect(subject.in_journey?).to eq false
    end

    it 'sets the minimum fare to touch in with at a default value of 1' do
      expect(subject.min_fare).to eq OysterCardStatus::MIN_FARE
    end
  end

  describe '#touch_in' do
    it 'changes oystercard status to in journey' do
      oystercard = OysterCard.new
      expect(oystercard.card_status.touch_in(1)).to eq oystercard.card_status
    end

    it 'user is not allowed to touch if there is less than £1 in the balance' do
      oystercard = OysterCard.new
      message = 'You dont have suffient balance to touch in'
      expect { oystercard.card_status.touch_in(oystercard.balance) }.to raise_error message
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
      subject.touch_in(1)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
  end



end

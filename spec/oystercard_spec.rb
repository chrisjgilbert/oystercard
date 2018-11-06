require 'oystercard'

describe OysterCard do

  let(:oystercard) { described_class.new }

  describe '#initialize' do
    it 'sets a default max limit' do
      expect(oystercard.max_limit).to eq OysterCard::MAX_LIMIT
    end

    it 'sets the user balance as 0 by default' do
      expect(oystercard.balance).to eq OysterCard::DEFAULT_BALANCE
    end

    it 'sets the users in_journey status to false by default' do
      expect(oystercard.in_journey).to be false
    end
  end

  describe '#top_up' do
    it 'Adds the top up value to the balance' do
      expect { oystercard.top_up(3) }.to change{ oystercard.balance}.by 3
    end

    it 'doesn"t allow the user to top up above card limit (£90)' do
      message = "Your balance is currently #{oystercard.balance} and your limit is #{OysterCard::MAX_LIMIT}"
      expect { oystercard.top_up(95) }.to raise_error message
    end

    it 'doesn"t allow the user to top up the balance above the max limit' do
      oystercard.top_up(90)
      message = "Your balance is currently #{oystercard.balance} and your limit is #{OysterCard::MAX_LIMIT}"
      expect { oystercard.top_up(5) }.to raise_error message
    end
  end

  describe '#deduct' do
    it 'allows a fare to be deducted from the balance' do
      oystercard.top_up(10)
      expect { oystercard.deduct(3) }.to change{ oystercard.balance }.by -3
    end
  end

  describe '#touch_in' do
    it 'sets users in journey status to true' do
      oystercard.touch_in
      expect(oystercard.in_journey).to be true
    end
  end

  describe '#touch_out' do
    it 'sets users in journey status to false' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey).to be false
    end
  end

end

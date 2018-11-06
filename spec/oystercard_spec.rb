require 'oystercard'

describe OysterCard do

  let(:oystercard) { described_class.new }

  describe '#initialize' do
    it 'sets a default max limit of 1' do
      expect(oystercard.max_limit).to eq OysterCard::MAX_LIMIT
    end

    it 'sets a default balance of 0' do
      expect(oystercard.balance).to eq OysterCard::DEFAULT_BALANCE
    end

    it 'sets in_journey status to false by default' do
      expect(oystercard.in_journey).to be false
    end
  end

  describe '#top_up' do
    it 'Adds the top up value to the balance' do
      expect { oystercard.top_up(3) }.to change{ oystercard.balance}.by 3
    end

    it 'doesn"t allow the user to top up above card limit (£90)' do
      message = "Your balance is currently #{oystercard.balance} and your limit is #{oystercard.max_limit}"
      expect { oystercard.top_up(95) }.to raise_error message
    end

    it 'doesn"t allow the user to top up the balance above the max limit' do
      oystercard.top_up(90)
      message = "Your balance is currently #{oystercard.balance} and your limit is #{oystercard.max_limit}"
      expect { oystercard.top_up(5) }.to raise_error message
    end
  end

  describe '#deduct' do
    it 'allows a fare to be deducted from the balance' do
      oystercard.top_up(10)
      expect { oystercard.deduct(3) }.to change {  oystercard.balance }.by -3
    end
  end

  describe '#touch_in' do
    it 'sets users in journey status to true' do
      oystercard.top_up(1)
      oystercard.touch_in
      expect(oystercard.in_journey).to be true
    end

    it 'raises an error when a user touches in with less than the minimum fare as their balance' do
      message = 'You have insufficient funds to touch in'
      expect { oystercard.touch_in }.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'sets users in journey status to false' do
      oystercard.top_up(1)
      oystercard.touch_out
      expect(oystercard.in_journey).to be false
    end

    it 'deducts the minmum fare from the users balance' do
      expect { oystercard.touch_out }.to change { oystercard.balance }.by -oystercard.min_fare
    end
  end

end

require 'oystercard'

describe OysterCard do

  let(:oystercard) { described_class.new }

  describe '#balance' do
    it 'returns the user balance' do
      expect(oystercard.balance).to eq 0
    end

    it 'allows the user to top up their balance' do
      expect(oystercard.top_up(5)).to eq 5
    end

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
end

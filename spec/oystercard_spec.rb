require 'oystercard'

describe OysterCard do

  let(:oystercard) { described_class.new }

  describe '#initialize' do
    it 'has a card status by default' do
      expect(oystercard.card_status).to be_a_kind_of OysterCardStatus
    end
  end

  describe '#balance' do
    it 'returns the user balance' do
      expect(oystercard.balance).to eq 0
    end

    it 'allows the user to top up their balance' do
      expect(oystercard.top_up(5)).to eq 5
    end

    it 'Adds the top up value to the balance' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it 'doesn"t allow the user to top up above card limit (£90)' do
      expect { oystercard.top_up(95) }.to raise_error "Your balance is currently #{oystercard.balance} and your limit is #{OysterCard::MAX_LIMIT}"
    end

    it 'doesnt" allow the user to top up the balance above the max limit' do
      oystercard.top_up(90)
      expect { oystercard.top_up(5) }.to raise_error "Your balance is currently #{oystercard.balance} and your limit is #{OysterCard::MAX_LIMIT}"
    end
  end

    describe '#deduct' do
      it ' Allows a fair to be deducted from the card' do
        oystercard.top_up(10)
        expect(oystercard.deduct(7)).to eq 7
      end

      it 'Deducts the fair from the balance' do
        oystercard.top_up(10)
        oystercard.deduct(7)
        expect(oystercard.balance).to eq 3
      end

    end
end
